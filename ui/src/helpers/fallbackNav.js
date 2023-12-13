"use strict";

module.exports = (nav, context) => {
    return nav || Object.values(context.data.root.site.components)[0].latest.navigation;
};
