'use strict'

module.exports = (...args) => args[0].find(x => x.version === args[1]);
