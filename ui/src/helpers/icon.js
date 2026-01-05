"use strict";

const fs = require("fs");

module.exports = name => {
  const commonPath = (process.env["ICONS_PATH"] || `./ui/node_modules/typedb-web-common/src/icons`) + `/${name}.svg`;
  const svgContent = fs.readFileSync(commonPath, "utf-8");
  return svgContent;
};
