

hljs.registerLanguage("graql", function (e) {
    GRAQL_KEYWORDS = {
        keyword:
            'relationship entity attribute sub has key is-abstract relates plays' +
            'datatype boolean double long string date' +
            'match isa contains regex val via id label' +
            'define undefine get insert delete aggregate compute' +
            'std median mean max min sum count group' +
            'path centrality cluster degree k-core where from to in' +
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
                {
                    className: 'graql-comment'
                }
            ),
            {
                className: 'graql-keyword',
                // must remain alphabetically sorted
                variants: [
                    { begin: /\baggregate\b/ },
                    { begin: /\basc\b/ },
                    { begin: /\bcentrality\b/ },
                    { begin: /\bcluster\b/ },
                    { begin: /\bcommit\b/ },
                    { begin: /\bcompute\b/ },
                    { begin: /\bcontains\b/ },
                    { begin: /\bcount\b/ },
                    { begin: /\bdatatype\b/ },
                    { begin: /\bdesc\b/ },
                    { begin: /\bdefine\b/ },
                    { begin: /\bdegree\b/ },
                    { begin: /\bdelete\b/ },
                    { begin: /\bfrom\b/ },
                    { begin: /\bget\b/ },
                    { begin: /\bgroup\b/ },
                    { begin: /\bhas\b/ },
                    { begin: /\bid\b/ },
                    { begin: /\bin\b/ },
                    { begin: /\binsert\b/ },
                    { begin: /\bis-abstract\b/ },
                    { begin: /\bisa\b/ },
                    { begin: /\bk-core\b/ },
                    { begin: /\bkey\b/ },
                    { begin: /\blabel\b/ },
                    { begin: /\blimit\b/ },
                    { begin: /\bmatch\b/ },
                    { begin: /\bmax\b/ },
                    { begin: /\bmean\b/ },
                    { begin: /\bmedia\b/ },
                    { begin: /\bmin\b/ },
                    { begin: /\boffset\b/ },
                    { begin: /\border by\b/ },
                    { begin: /\bplays\b/ },
                    { begin: /\brelates\b/ },
                    { begin: /\bregex\b/ },
                    { begin: /\bstd\b/ },
                    { begin: /\bsub\b/ },
                    { begin: /\bsum\b/ },
                    { begin: /\bthen\b/ },
                    { begin: /\bto\b/ },
                    { begin: /\bundefine\b/ },
                    { begin: /\bval\b/ },
                    { begin: /\bvia\b/ },
                    { begin: /\bwhen\b/ },
                    { begin: /\bwhere\b/ },

                ]
            },
            {
                className: 'graql-type',
                variants: [
                    { begin: /\entity|attribute|relationship\b/ },
                    { begin: /\brule\b/ },
                    { begin: /\bboolean|double|long|string|date\b/ },
                    {
                        beginKeywords: "sub",
                        begin: /\bsub [^,]+/
                    }
                ]
            },
            {
                className: 'graql-variable',
                begin: /\$[^\s]+/
            },
            // {
            //     className: 'keyword',
            //     // beginKeywords: 'struct protocol class extension enum',
            //     keywords: GRAQL_KEYWORDS,
            //     // end: '\\{',
            //     // excludeEnd: true,
            //     // contains: [
            //     //   hljs.inherit(hljs.TITLE_MODE, {begin: /[A-Za-z$_][\u00C0-\u02B80-9A-Za-z$_]*/})
            //     // ]
            //   },
            {
                className: 'string',
                begin: '\"', end: '\"',
                contains: [hljs.BACKSLASH_ESCAPE, { begin: '\"\"' }]
            },
            // {
            //     className: 'keword',
            //     begin:
            // },
            // hljs.COMMENT('#*'),
            // hljs.C_NUMBER_MODE
        ]
    };
});