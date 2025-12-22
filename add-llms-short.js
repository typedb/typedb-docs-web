const fs = require('fs');
const path = require('path');
const rootDir = './dist';

if (!fs.existsSync(rootDir)) {
    console.error(`❌ Content directory "${rootDir}" not found. Did Antora run yet?`);
    process.exit(1);
}

const llmsInputPath = "./llms-short.txt";
const llmsOutputPath = path.join(rootDir, 'llms-short.txt');
fs.copyFileSync(llmsInputPath, llmsOutputPath);
