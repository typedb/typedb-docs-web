"use strict";

module.exports = (context) => context.data.root.page.editUrl?.replace("/:content/", "/");
