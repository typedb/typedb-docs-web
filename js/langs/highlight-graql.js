
hljs.registerLanguage("lang-graql", function (e) {
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
                    { begin: /\b(entity|attribute|relationship|thing|role)[^-]/ },
                    { begin: /\brule\b[^-]/, exclude: /,/ },
                    { begin: /(boolean|double|long|string|date)/, end: /;|,|\n/, excludeEnd: true },
                ]
            },
            {
                className: 'graql-keyword',
                variants: [
                    // superset to other keywords. example min-k is superior to min
                    { begin: /(^|\s)min-k\s/ },
                    // must remain alphabetically sorted
                    { begin: /\saggregate\s/ },
                    { begin: /\sasc(\s|;)/ },
                    { begin: /\sas\s/ },
                    { begin: /\sby\s/ },
                    { begin: /centrality(\s|;)/ },
                    { begin: /\scluster\s/ },
                    { begin: /(^|\s)commit\s/ },
                    { begin: /(^|\s)compute\s/ },
                    { begin: /(^|\s)contains\s/ },
                    { begin: /(^|\s)count\s/ },
                    { begin: /(^|\s)datatype\s/ },
                    { begin: /(^|\s)desc\s/ },
                    { begin: /(^|\s)define\s/ },
                    { begin: /(^|\s)degree(\s|;)/ },
                    { begin: /(^|\s)delete\s/ },
                    { begin: /(^|\s)from\s/ },
                    { begin: /(^|\s)get(\s|;)/ },
                    { begin: /(^|\s)group\s/ },
                    { begin: /(^|\s)has\s/ },
                    { begin: /(^|\s)id\s/ },
                    { begin: /(^|\s)in\s/ },
                    { begin: /(^|\s)insert\s/ },
                    { begin: /(^|\s)is-abstract\s/ },
                    { begin: /(^|\s)isa\s/ },
                    { begin: /(^|\s)k-core(\s|;)/ },
                    { begin: /(^|\s)key\s/ },
                    { begin: /(^|\s)label\s/ },
                    { begin: /(^|\s)limit\s/ },
                    { begin: /(^|\s)match\s/ },
                    { begin: /(^|\s)max\s/ },
                    { begin: /(^|\s)mean\s/ },
                    { begin: /(^|\s)median\s/ },
                    { begin: /(^|\s)min\s/ },
                    { begin: /(^|\s)of\s/ },
                    { begin: /(^|\s)offset\s/ },
                    { begin: /(^|\s)or\s/ },
                    { begin: /(^|\s)order\s/ },
                    { begin: /(^|\s)order by\s/ },
                    { begin: /(^|\s)plays\s/ },
                    { begin: /(^|\s)relates\s/ },
                    { begin: /(^|\s)regex\s\// },
                    { begin: /(^|\s)std\s/ },
                    { begin: /(^|\s)sub\s/ },
                    { begin: /(^|\s)sum\s/ },
                    { begin: /(^|\s)then\s/ },
                    { begin: /(^|\s)to\s/ },
                    { begin: /(^|\s)undefine\s/ },
                    { begin: /(^|\s)using\s/ },
                    { begin: /(^|\s)val\s/ },
                    { begin: /(^|\s)via\s/ },
                    { begin: /(^|\s)when\s/ },
                    { begin: /(^|\s)where\s/ },
                ]
            },
            // {
            //     className: 'graql-roleplayer',
            //     begin: /[^\(,\s]+:/
            // },
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