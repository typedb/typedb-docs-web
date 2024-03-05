'use strict'

module.exports = (...args) => {
  const numArgs = args.length;
  if (numArgs === 2 && args[0]) {
    return args[0].replace('/development/content/', '/development/');
  }
  if (numArgs < 2) throw new Error('{{fixEditUrl}} helper expects at least 1 arguments');
  return "";
}