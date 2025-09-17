const fs = require('fs');
const path = require('path');
const { parseStringPromise, Builder } = require('xml2js');

// === CONFIGURATION ===
const OUTPUT_DIR = './dist'; // Antora bundle output folder
const SITE_URL = 'https://typedb.com/docs'; // Absolute site URL
const EXCLUDE_COMPONENTS = ['manual', 'typeql', 'drivers'];
const EXCLUDE_VERSION_PATTERN = /\/2\.[^/]*\//; // matches /2.x/ in URL paths
const SITEMAP_INDEX_FILE = 'sitemap.xml';

// === FUNCTIONS ===
async function processSitemapFile(filePath) {
    const xml = fs.readFileSync(filePath, 'utf-8');
    const json = await parseStringPromise(xml);

    if (json.sitemapindex) {
        // Filter out excluded component sitemaps
        json.sitemapindex.sitemap = json.sitemapindex.sitemap.filter(s => {
            const loc = s.loc[0];
            return !EXCLUDE_COMPONENTS.some(comp => loc.includes(comp));
        });
    } else if (json.urlset) {
        // Filter URLs with excluded versions
        json.urlset.url = json.urlset.url.filter(u => {
            const loc = u.loc[0];
            return !EXCLUDE_VERSION_PATTERN.test(loc);
        });
    }

    const builder = new Builder();
    const updatedXml = builder.buildObject(json);
    fs.writeFileSync(filePath, updatedXml, 'utf-8');
    console.log(`Processed ${filePath}`);
}

function rebuildSitemapIndex() {
    const sitemapFiles = fs.readdirSync(OUTPUT_DIR)
        .filter(f => f.startsWith('sitemap-') && f.endsWith('.xml'))
        .filter(f => !EXCLUDE_COMPONENTS.some(comp => f.includes(comp)));

    const sitemapIndex = {
        sitemapindex: {
            $: { xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9' },
            sitemap: sitemapFiles.map(f => ({
                loc: [`${SITE_URL}/${f}`], // absolute URLs
                lastmod: [new Date().toISOString()]
            }))
        }
    };

    const builder = new Builder();
    const xml = builder.buildObject(sitemapIndex);
    fs.writeFileSync(path.join(OUTPUT_DIR, SITEMAP_INDEX_FILE), xml, 'utf-8');
    console.log(`Rebuilt ${SITEMAP_INDEX_FILE} with ${sitemapFiles.length} component sitemaps`);
}

async function main() {
    const xmlFiles = fs.readdirSync(OUTPUT_DIR).filter(f => f.endsWith('.xml'));

    for (const file of xmlFiles) {
        await processSitemapFile(path.join(OUTPUT_DIR, file));
    }

    rebuildSitemapIndex();
    console.log('Sitemap filtering complete.');
}

// === RUN SCRIPT ===
main().catch(err => console.error(err));
