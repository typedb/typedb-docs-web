

hljs.registerLanguage("graql", function (e) {
    GRAQL_KEYWORDS = {
        keyword:
            'relationship entity attribute sub has key is-abstract relates plays' +
            'datatype boolean double long string date' +
            'match isa contains regex val via id label' +
            'define undefine get insert delete aggregate compute' +
            'std median mean max min sum count group' +
            'path centrality cluster degree k-core where from to in of' +
            'limit offset order by asc desc' +
            'rule when then' +
            'commit',
        literal: 'true false nil',
    };

    return {
        aliases: ['graql', 'gql'],
        case_insensitive: true,
        // keywords: GRAQL_KEYWORDS,
        contains: [
            hljs.COMMENT(
                '\#(.*)',
                '\n|\r\n|\r',
                { className: 'graql-comment' }
            ),
            {
                className: 'graql-type',
                variants: [
                    { begin: /\bentity|attribute|relationship|thing|role\b/ },
                    { begin: /\brule\b/ },
                    { begin: /\bboolean|double|long|string|date\b/ },
                ]
            },
            {
                className: 'graql-keyword',
                variants: [
                    // superset to other keywords. example min-k is superior to min
                    { begin: /(^|\s)min-k\b/ },
                    // must remain alphabetically sorted
                    { begin: /(^|\s)aggregate\b/ },
                    { begin: /(^|\s)asc\b/ },
                    { begin: /(^|\s)as\b/ },
                    { begin: /(^|\s)centrality\b/ },
                    { begin: /(^|\s)cluster\b/ },
                    { begin: /(^|\s)commit\b/ },
                    { begin: /(^|\s)compute\b/ },
                    { begin: /(^|\s)contains\b/ },
                    { begin: /(^|\s)count\b/ },
                    { begin: /(^|\s)datatype\b/ },
                    { begin: /(^|\s)desc\b/ },
                    { begin: /(^|\s)define\b/ },
                    { begin: /(^|\s)degree\b/ },
                    { begin: /(^|\s)delete\b/ },
                    { begin: /(^|\s)from\b/ },
                    { begin: /(^|\s)get\b/ },
                    { begin: /(^|\s)group\b/ },
                    { begin: /(^|\s)has\b/ },
                    { begin: /(^|\s)id\b/ },
                    { begin: /(^|\s)in\b/ },
                    { begin: /(^|\s)insert\b/ },
                    { begin: /(^|\s)is-abstract\b/ },
                    { begin: /(^|\s)isa\b/ },
                    { begin: /(^|\s)k-core\b/ },
                    { begin: /(^|\s)key\b/ },
                    { begin: /(^|\s)label\b/ },
                    { begin: /(^|\s)limit\b/ },
                    { begin: /(^|\s)match\b/ },
                    { begin: /(^|\s)max\b/ },
                    { begin: /(^|\s)mean\b/ },
                    { begin: /(^|\s)media\b/ },
                    { begin: /(^|\s)min\b/ },
                    { begin: /(^|\s)of\b/ },
                    { begin: /(^|\s)offset\b/ },
                    { begin: /(^|\s)order by\b/ },
                    { begin: /(^|\s)plays\b/ },
                    { begin: /(^|\s)relates\b/ },
                    { begin: /(^|\s)regex\b/ },
                    { begin: /(^|\s)std\b/ },
                    { begin: /(^|\s)sub\b/ },
                    { begin: /(^|\s)sum\b/ },
                    { begin: /(^|\s)then\b/ },
                    { begin: /(^|\s)to\b/ },
                    { begin: /(^|\s)undefine\b/ },
                    { begin: /(^|\s)using\b/ },
                    { begin: /(^|\s)val\b/ },
                    { begin: /(^|\s)via\b/ },
                    { begin: /(^|\s)when\b/ },
                    { begin: /(^|\s)where\b/ },
                ]
            },
            {
                className: 'graql-roleplayer',
                begin: /[^\(,\s]+:/
            },
            {
                className: 'graql-variable',
                begin: /\$[^\s,);]+/
            },
            {
                className: 'string',
                begin: '\"', end: '\"',
                contains: [hljs.BACKSLASH_ESCAPE, { begin: '\"\"' }]
            }
        ]
    };
});