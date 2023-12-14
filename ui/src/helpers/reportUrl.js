"use strict";

module.exports = (context) => {
    const { page } = context.data.root;
    const url = new URL(page.attributes["issue-url"]);
    url.searchParams.set(
        "body",
        `#### Page(s):\n[${page.component && `${page.component.title} > `}${page.title}](${
            page.canonicalUrl
        })\n\n### What is wrong:\n\n### Suggested fix:`
    );
    return url.toString();
};
