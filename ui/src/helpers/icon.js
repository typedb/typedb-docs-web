"use strict";

const fs = require("fs");

module.exports = name => {
  const commonPath = `./node_modules/typedb-web-common/src/icons/${name}.svg`;
  const svgContent = fs.readFileSync(commonPath, "utf-8");
  return svgContent;
};
