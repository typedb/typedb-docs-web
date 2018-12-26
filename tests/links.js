/**
 * Reports any internal broken links.
 * This includes anchors and pages that don't exist.
 *
 * TO BE WRITTEN IN JAVA AS A PART OF THE CIRCLE CI TESTS
 */

const fs = require('fs');
const path = require('path');
var jsdom = require('jsdom');
const { JSDOM } = jsdom;
const { window } = new JSDOM();
const { document } = (new JSDOM('')).window;
global.document = document;
var $ = jQuery = require('jquery')(window);

ignoredDirs = ["images"];
targetDir = "./_site/docs";
JEKYLL_BUILD_PATH = "_site";

/**
 * Explores recursively a directory and returns all the filepaths and folderpaths in the callback.
 *
 * @see http://stackoverflow.com/a/5827895/4241030
 * @param {String} dir
 * @param {Function} done
 */
function getFiles(dir, done) {
    let results = [];

    fs.readdir(dir, function(err, list) {
        if (err) return done(err);

        var pending = list.length;

        if (!pending) return done(null, results);

        list.forEach(function(filePath){
            filePath = path.resolve(dir, filePath);
            if(! ignoredDirs.includes(filePath.split(targetDir)[1])) {
                fs.stat(filePath, function(err, stat){
                    // If directory, execute a recursive call
                    if (stat && stat.isDirectory()) {
                        // Add directory to array [comment if you need to remove the directories from the array]
                        // results.push({ filePath, content });

                        getFiles(filePath, function(err, res){
                            results = results.concat(res);
                            if (!--pending) done(null, results);
                        });
                    } else {
                        const content = fs.readFileSync(filePath, 'utf8');
                        results.push({ filePath, content });

                        if (!--pending) done(null, results);
                    }
                });
            }
        });
    });
};


getFiles("./_site/docs", function(err, files){
    if(err){ throw err; }
    files = files.map(file => {
        if (file.filePath.slice(-4) == "html") {
            return { filePath: file.filePath.split(JEKYLL_BUILD_PATH)[1], content: file.content}
        }
    }).filter(file => file != undefined);
    // console.log(files.map(file => file ? file.filePath : ""));
    checkLinksHealth(files);
});


function checkLinksHealth(files) {
    for (file of files) {
        const page = $(file.content);
        page.find("#o-content a").each(function() {
            href = $(this).attr("href")

            if(href.indexOf("http") == -1) {
                // checking local anchor
                if(href[0] == "#") {
                    if(page.find(href).length == 0){
                        // console.log(page)
                        console.log("A - The link [" + href + "] in [" + file.filePath + "] is broken!\n");
                    }
                } else {
                    // checking external anchor
                    if(href.indexOf("#") > -1) {
                        if (href.indexOf("?") > -1) {
                            externalPath = href.split("?")[0] + ".html";
                        } else {
                            externalPath = href.split("#")[0] + ".html";
                        }
                        id = "#" + href.split("#")[1];

                        externalFile = files.filter(f => f.filePath === externalPath );

                        if (externalFile.length == 0) {
                            console.log("B - The link [" + href + "] in [" + file.filePath + "] is broken!\n");
                        } else if ($(externalFile[0].content).find(id).length == 0) {
                            console.log("C - The link [" + href + "] in [" + file.filePath + "] is broken!\n");
                        }
                    }
                }

            }
        })
    }
}


