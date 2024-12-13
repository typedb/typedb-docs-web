"use strict";

const autoprefixer = require("autoprefixer");
const browserify = require("browserify");
const fs = require("fs-extra");
const concat = require("gulp-concat");
const imagemin = require("gulp-imagemin");
const postcss = require("gulp-postcss");
const sass = require("gulp-sass")(require("sass"));
const uglify = require("gulp-uglify");
const merge = require("merge-stream");
const ospath = require("path");
const postcssUrl = require("postcss-url");
const { Transform } = require("stream");
const vfs = require("vinyl-fs");
const webpack = require("webpack-stream");
const { footer, topbar, getFooterData, getTopbarData } = require("typedb-web-common/lib");

const path = ospath.posix;
const map = (transform) => new Transform({ objectMode: true, transform });
const through = () => map((file, enc, next) => next(null, file));

module.exports = (src, dest, preview) => (cb) => {
    const commonPackage = "node_modules/typedb-web-common";
    const commonSrc = `${commonPackage}/src`;
    const sassIncludePath = `${commonSrc}/styles`;
    const opts = { base: src, cwd: src };
    const sourcemaps = preview || process.env.SOURCEMAPS === "true";
    const postcssPlugins = [
        postcssUrl([
            {
                filter: (asset) => asset.url.endsWith(".svg"),
                url: "inline",
                basePath: ospath.resolve(commonSrc),
            },
            {
                url: (asset) => {
                    const abspath = asset.pathname.startsWith("~")
                        ? ospath.resolve("node_modules", asset.pathname.slice(1))
                        : ospath.resolve(sassIncludePath, asset.pathname);
                    const basename = ospath.basename(abspath);
                    const destpath = ospath.join(dest, "font", basename);
                    if (!fs.pathExistsSync(destpath)) fs.copySync(abspath, destpath);
                    return path.join("..", "font", basename);
                },
            },
        ]),
        autoprefixer({ cascade: false }),
    ];

    merge(
        vfs.src("ui.yml", { ...opts, allowEmpty: true }),
        vfs
            .src("js/+([0-9])-*.js", { ...opts, read: false, sourcemaps })
            .pipe(bundle(opts))
            .pipe(uglify({ output: { comments: /^! / } }))
            // NOTE concat already uses stat from newest combined file
            .pipe(concat("js/site.js")),
        vfs
            .src("js/vendor/*([^.])?(.bundle).js", { ...opts, read: false })
            .pipe(bundle(opts))
            .pipe(uglify({ output: { comments: /^! / } })),
        vfs.src("js/common.js", { ...opts, read: false }).pipe(
            webpack({
                mode: "production",
                entry: `./${src}/js/common.js`,
                output: {
                    filename: "js/common.js",
                },
            })
        ),
        vfs
            .src("js/vendor/*.min.js", opts)
            .pipe(map((file, enc, next) => next(null, Object.assign(file, { extname: "" }, { extname: ".js" })))),
        // NOTE use the next line to bundle a JavaScript library that cannot be browserified, like jQuery
        //vfs.src(require.resolve('<package-name-or-require-path>'), opts).pipe(concat('js/vendor/<library-name>.js')),
        vfs
            .src(["css/site.scss"], { ...opts, sourcemaps })
            .pipe(sass({ includePaths: [sassIncludePath, "node_modules"] }).on("error", sass.logError))
            .pipe(postcss((file) => ({ plugins: postcssPlugins, options: { file } }))),
        vfs.src("font/*.{ttf,woff*(2)}", opts),
        vfs.src("img/**/*.{gif,ico,jpg,png,svg}", opts).pipe(
            preview
                ? through()
                : imagemin(
                      [
                          imagemin.gifsicle(),
                          imagemin.jpegtran(),
                          imagemin.optipng(),
                          imagemin.svgo({
                              plugins: [
                                  { cleanupIDs: { preservePrefixes: ["icon-", "view-"] } },
                                  { removeViewBox: false },
                                  { removeDesc: false },
                              ],
                          }),
                      ].reduce((accum, it) => (it ? accum.concat(it) : accum), [])
                  )
        ),
        vfs.src("helpers/*.js", opts),
        vfs.src("layouts/*.hbs", opts),
        vfs.src("partials/*.hbs", opts),
        vfs.src("static/**/*[!~]", {
            ...opts,
            base: ospath.join(src, "static"),
            dot: true,
        })
    )
        .pipe(vfs.dest(dest, { sourcemaps: sourcemaps && "." }))
        .on("end", async () => {
            const urlPrefix = "https://typedb.com";
            const topbarData = getTopbarData();
            const footerData = getFooterData();
            const topbarHTML = topbar(await topbarData, urlPrefix);
            const footerHTML = footer(await footerData, urlPrefix);
            fs.writeFileSync(`${dest}/partials/header-content.hbs`, topbarHTML);
            fs.writeFileSync(`${dest}/partials/footer-content.hbs`, footerHTML);
            cb();
        });
};

function bundle({ base: basedir, ext: bundleExt = ".bundle.js" }) {
    return map((file, enc, next) => {
        if (bundleExt && file.relative.endsWith(bundleExt)) {
            const mtimePromises = [];
            const bundlePath = file.path;
            browserify(file.relative, { basedir, detectGlobals: false })
                .plugin("browser-pack-flat/plugin")
                .on("file", (bundledPath) => {
                    if (bundledPath !== bundlePath) mtimePromises.push(fs.stat(bundledPath).then(({ mtime }) => mtime));
                })
                .bundle((bundleError, bundleBuffer) =>
                    Promise.all(mtimePromises).then((mtimes) => {
                        const newestMtime = mtimes.reduce((max, curr) => (curr > max ? curr : max), file.stat.mtime);
                        if (newestMtime > file.stat.mtime) file.stat.mtimeMs = +(file.stat.mtime = newestMtime);
                        if (bundleBuffer !== undefined) file.contents = bundleBuffer;
                        next(
                            bundleError,
                            Object.assign(file, {
                                path: file.path.slice(0, file.path.length - 10) + ".js",
                            })
                        );
                    })
                );
            return;
        }
        fs.readFile(file.path, "UTF-8").then((contents) => {
            next(null, Object.assign(file, { contents: Buffer.from(contents) }));
        });
    });
}
