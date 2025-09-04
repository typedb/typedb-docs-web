// build-llms.js
const fs = require('fs');
const path = require('path');
const cheerio = require('cheerio');
const TurndownService = require('turndown');

const rootDir = './dist';
const SITE_BASE_URL = 'https://typedb.com/docs/';

const turndownService = new TurndownService({
    codeBlockStyle: 'fenced',
    headingStyle: 'atx',
});

if (!fs.existsSync(rootDir)) {
    console.error(`❌ Content directory "${rootDir}" not found. Did Antora run yet?`);
    process.exit(1);
}

// Components to exclude entirely
const excludedComponents = new Set([
    'academy',
    'manual',
    'drivers',
    'typeql',
]);

// Section order for sorting
const sectionOrder = [
    'home',
    'examples',
    'core-concepts',
    'tools',
    'maintenance-operation',
    'reference',
];
const sectionWeight = {};
sectionOrder.forEach((name, i) => { sectionWeight[name] = i; });

// Collect for sorting later
const collected = [];

// Stream target file (truncate if exists)
const llmsPath = path.join(rootDir, 'llms.txt');
fs.writeFileSync(llmsPath, '', 'utf8');

let skippedComponentsCount = 0;
let skippedRedirectCount = 0;
let skipped2xCount = 0;

function shouldSkipByPath(relPath) {
    const parts = relPath.split(path.sep);
    const componentSegment = parts[0] || '';
    const versionSegment = parts[1] || '';

    if (excludedComponents.has(componentSegment)) {
        skippedComponentsCount++;
        return true;
    }
    if (/^2\./.test(versionSegment)) {
        skipped2xCount++;
        return true;
    }
    return false;
}

function processHtmlFile(fullPath, relPath) {
    if (shouldSkipByPath(relPath)) return;

    const html = fs.readFileSync(fullPath, 'utf8');
    const $ = cheerio.load(html);

    const title =
        $('title').text().trim() ||
        $('h1').first().text().trim() ||
        'Untitled';

    if (title === 'Redirect Notice' || title.startsWith('Redirect Notice')) {
        skippedRedirectCount++;
        return;
    }

    const main = $('main').length ? $('main').html() : $('article').html() || $('body').html() || '';
    const markdown = turndownService.turndown(main);

    const outPath = path.join(rootDir, relPath.replace(/\.html$/, '.md'));
    fs.mkdirSync(path.dirname(outPath), { recursive: true });
    fs.writeFileSync(outPath, markdown, 'utf8');

    const rel = relPath.replace(/\.html$/, '.md').replace(/\\/g, '/');
    const url = SITE_BASE_URL + rel;

    collected.push({ rel, url, title });
}

function walk(dir, relBase = '') {
    for (const entry of fs.readdirSync(dir)) {
        const fullPath = path.join(dir, entry);
        const relPath = path.join(relBase, entry);
        const stats = fs.statSync(fullPath);
        if (stats.isDirectory()) {
            walk(fullPath, relPath);
        } else if (fullPath.endsWith('.html')) {
            processHtmlFile(fullPath, relPath);
        }
    }
}

walk(rootDir);

// Sort according to section order
collected.sort((a, b) => {
    const aSection = a.rel.split('/')[0];
    const bSection = b.rel.split('/')[0];
    const aWeight = sectionWeight[aSection] ?? 999;
    const bWeight = sectionWeight[bSection] ?? 999;
    if (aWeight !== bWeight) return aWeight - bWeight;
    return a.rel.localeCompare(b.rel);
});

// Append to llms.txt as sorted
for (const { title, url } of collected) {
    fs.appendFileSync(llmsPath, `[${title}](${url})\n`, 'utf8');
}

console.log(`\n✅ Wrote llms.txt with ${collected.length} entries.`);
