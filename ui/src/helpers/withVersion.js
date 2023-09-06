"use strict";

const crypto = require("crypto");
const fs = require("fs");

const hexMap = {};

module.exports = (path, context) => {
  hexMap[path] =
    hexMap[path] ??
    crypto
      .createHash("sha256")
      .update(fs.readFileSync(`./ui/public/_/${path}`))
      .digest("hex")
      .slice(-16);
  return `${context.data.root.uiRootPath}/${path}?v=${hexMap[path]}`;
};
