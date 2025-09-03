// build-llms.js
const fs = require('fs');
const path = require('path');
const jsdom = require('jsdom');
const TurndownService = require('turndown');
const { JSDOM } = jsdom;

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

// Define the desired order for top-level sections
const sectionOrder = [
    'home',
    'examples',
    'core-concepts',
    'tools',
    'maintenance-operation',
    'reference'
];

const sectionWeight = {};
sectionOrder.forEach((name, i) => { sectionWeight[name] = i; });

const mdIndex = [];
let skippedComponentsCount = 0;
let skippedRedirectCount = 0;
let skipped2xCount = 0;

function shouldInclude(relPath, title) {
    const parts = relPath.split(path.sep);
    const componentSegment = parts[0] || '';
    const versionSegment = parts[1] || '';

    // Excluded components
    if (excludedComponents.has(componentSegment)) {
        skippedComponentsCount++;
        console.log(`Skipping excluded component: ${relPath}`);
        return false;
    }

    // Global 2.x filter
    if (/^2\./.test(versionSegment)) {
        skipped2xCount++;
        console.log(`Skipping 2.x page: ${relPath}`);
        return false;
    }

    // Skip redirect notice pages
    if (title === 'Redirect Notice' || title?.startsWith('Redirect Notice')) {
        skippedRedirectCount++;
        console.log(`Skipping redirect notice page: ${relPath}`);
        return false;
    }

    return true;
}

function convertHtmlFile(htmlPath, relPath) {
    const html = fs.readFileSync(htmlPath, 'utf8');
    const dom = new JSDOM(html);
    const doc = dom.window.document;

    let title = doc.querySelector('title')?.textContent?.trim()
        || doc.querySelector('h1')?.textContent?.trim()
        || 'Untitled';

    if (!shouldInclude(relPath, title)) return;

    const mainContent = doc.querySelector('main, article') || doc.body;
    const markdown = turndownService.turndown(mainContent.innerHTML);

    const outPath = path.join(rootDir, relPath.replace(/\.html$/, '.md'));
    fs.mkdirSync(path.dirname(outPath), { recursive: true });
    fs.writeFileSync(outPath, markdown, 'utf8');

    const rel = relPath.replace(/\.html$/, '.md').replace(/\\/g, '/');
    const url = SITE_BASE_URL + rel;

    mdIndex.push({ url, title, rel });
    console.log(`Converted: ${relPath} → ${rel} [${title}]`);
}

function walk(dir, relBase = '') {
    for (const entry of fs.readdirSync(dir)) {
        const fullPath = path.join(dir, entry);
        const relPath = path.join(relBase, entry);
        const stats = fs.statSync(fullPath);
        if (stats.isDirectory()) {
            walk(fullPath, relPath);
        } else if (fullPath.endsWith('.html')) {
            convertHtmlFile(fullPath, relPath);
        }
    }
}

walk(rootDir);

// Sort according to sectionOrder
mdIndex.sort((a, b) => {
    const aSection = a.rel.split('/')[0];
    const bSection = b.rel.split('/')[0];

    const aWeight = sectionWeight[aSection] !== undefined ? sectionWeight[aSection] : 999;
    const bWeight = sectionWeight[bSection] !== undefined ? sectionWeight[bSection] : 999;

    if (aWeight !== bWeight) return aWeight - bWeight;
    return a.rel.localeCompare(b.rel);
});

// Write llms.txt
const llmsContent = mdIndex
    .map(({ title, url }) => `[${title}](${url})`)
    .join('\n');

fs.writeFileSync(path.join(rootDir, 'llms.txt'), llmsContent, 'utf8');

// Summary
console.log(`\n✅ Wrote llms.txt with ${mdIndex.length} entries.`);
