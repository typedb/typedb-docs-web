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

// Components to exclude entirely (2.x-era legacy; driver API docs now live under reference)
const excludedComponents = new Set([
    'manual',
    'drivers',
    'typeql',
]);

// Section order and display names for llms.txt
const sections = [
    ['home', 'Home'],
    ['examples', 'Examples'],
    ['learn-typedb', 'Learn TypeDB'],
    ['academy', 'TypeDB Academy'],
    ['core-concepts', 'Core Concepts'],
    ['guides', 'Guides'],
    ['use-cases', 'Use Cases'],
    ['tools', 'Tools'],
    ['maintenance-operation', 'Maintenance & Operation'],
    ['typeql-reference', 'TypeQL Reference'],
    ['reference', 'Reference'],
];
const sectionWeight = {};
const sectionTitle = {};
sections.forEach(([slug, title], i) => {
    sectionWeight[slug] = i;
    sectionTitle[slug] = title;
});

const llmsHeader = `# TypeDB Documentation

> TypeDB is a polymorphic database with a conceptual data model and TypeQL, its strongly-typed query language. This index covers TypeDB 3.x. Every link below points to a Markdown version of the corresponding documentation page — prefer those over the HTML pages.

Before generating any TypeQL, read [llms-full.txt](${SITE_BASE_URL}llms-full.txt): a condensed summary of TypeQL 3.0 syntax and semantics, including its differences from TypeQL 2.x.
`;

// Collect for sorting later
const collected = [];

let skippedComponentsCount = 0;
let skippedRedirectCount = 0;
let skipped2xCount = 0;
let missingDescriptionCount = 0;

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

// True if a site path (relative to the site root, /-separated) has no Markdown twin
function hasNoMarkdownTwin(sitePath) {
    const parts = sitePath.split('/');
    return excludedComponents.has(parts[0]) || /^2\./.test(parts[1] || '');
}

// Point internal page links at the Markdown twins, so an agent following links
// stays in the Markdown version of the site. Handles both URL styles: indexify
// ("../foo/", used in CI) and plain ("../foo.html", used in local builds).
function rewriteInternalLinks($, relPath) {
    const pageDir = path.posix.dirname(relPath.split(path.sep).join('/'));
    $('a[href]').each((_, el) => {
        const href = $(el).attr('href');
        // Only relative links: leave absolute URLs, schemes, and pure-hash links alone
        if (!href || /^([a-z][a-z0-9+.-]*:|\/\/|\/|#)/i.test(href)) return;

        const hashIdx = href.indexOf('#');
        const hash = hashIdx === -1 ? '' : href.slice(hashIdx);
        const target = hashIdx === -1 ? href : href.slice(0, hashIdx);

        let mdTarget;
        if (target.endsWith('/')) mdTarget = target + 'index.md';
        else if (target.endsWith('.html')) mdTarget = target.replace(/\.html$/, '.md');
        else return;

        const resolved = path.posix.normalize(path.posix.join(pageDir === '.' ? '' : pageDir, target));
        if (hasNoMarkdownTwin(resolved)) return;

        $(el).attr('href', mdTarget + hash);
    });
}

function extractDescription($) {
    const meta = ($('meta[name="description"]').attr('content') || '').trim();
    let text = meta || $('main p').first().text().trim();
    text = text.replace(/\s+/g, ' ');
    if (!text) missingDescriptionCount++;
    if (text.length > 180) text = text.slice(0, 180).replace(/\s+\S*$/, '') + ' …';
    return text;
}

function processHtmlFile(fullPath, relPath) {
    if (shouldSkipByPath(relPath)) return;

    const html = fs.readFileSync(fullPath, 'utf8');
    const $ = cheerio.load(html);

    const rawTitle =
        $('title').text().trim() ||
        $('h1').first().text().trim() ||
        'Untitled';

    if (rawTitle === 'Redirect Notice' || rawTitle.startsWith('Redirect Notice')) {
        skippedRedirectCount++;
        return;
    }

    // Titles are breadcrumbs ("TypeDB | Docs > Section > Page") — keep the page part only
    const title = rawTitle.split('>').pop().trim() || rawTitle;
    const description = extractDescription($);

    rewriteInternalLinks($, relPath);

    const main = $('main').length ? $('main').html() : $('article').html() || $('body').html() || '';
    const markdown = turndownService.turndown(main);

    const outPath = path.join(rootDir, relPath.replace(/\.html$/, '.md'));
    fs.mkdirSync(path.dirname(outPath), { recursive: true });
    fs.writeFileSync(outPath, markdown, 'utf8');

    const rel = relPath.replace(/\.html$/, '.md').replace(/\\/g, '/');
    const url = SITE_BASE_URL + rel;

    collected.push({ rel, url, title, description });
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

// Emit llms.txt in the llmstxt.org shape: H1, blockquote summary, H2 per section,
// then one "- [title](url): description" line per page
const lines = [llmsHeader];
let currentSection = null;
for (const { rel, url, title, description } of collected) {
    const section = rel.split('/')[0];
    if (section !== currentSection) {
        if (currentSection !== null) lines.push('');
        currentSection = section;
        const display = sectionTitle[section] ||
            section.split('-').map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
        lines.push(`## ${display}`, '');
    }
    lines.push(`- [${title}](${url})${description ? ': ' + description : ''}`);
}
lines.push('');

fs.writeFileSync(path.join(rootDir, 'llms.txt'), lines.join('\n'), 'utf8');

console.log(`\n✅ Wrote llms.txt with ${collected.length} entries.`);
console.log(`   Skipped: ${skippedComponentsCount} excluded-component pages, ${skipped2xCount} 2.x pages, ${skippedRedirectCount} redirects.`);
if (missingDescriptionCount) console.log(`   ⚠️ ${missingDescriptionCount} pages had no description or lead paragraph.`);
