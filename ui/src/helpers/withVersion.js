"use strict";

const crypto = require("crypto");
const fs = require("fs");

const hexMap = {};

module.exports = path => {
  hexMap[path] =
    hexMap[path] ??
    crypto
      .createHash("sha256")
      .update(getFileContent(path))
      .digest("hex")
      .slice(-16);
  return `${path}?v=${hexMap[path]}`;
};

function getFileContent(path) {
  try {
    return fs.readFileSync(`./ui/public/_/${path}`);
  } catch {
    return Date.now().toString();
  }
}
