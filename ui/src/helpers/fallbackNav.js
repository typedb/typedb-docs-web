"use strict";

module.exports = (nav, context) => {
    return nav || context.data.root.site.components.home.latest.navigation;
};
