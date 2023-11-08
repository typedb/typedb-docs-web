"use strict";

const fs = require("fs");

module.exports = name => {
  const fileName = name.replace("_", "-");
  const commonPath = `./ui/node_modules/typedb-web-common/src/icons/${fileName}.svg`;
  const svgContent = fs.readFileSync(commonPath, "utf-8");
  return svgContent;
};
