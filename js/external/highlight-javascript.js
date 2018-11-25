/*
Language: JavaScript
Category: common, scripting
*/
hljs.registerLanguage("javascript", function (e) {
  /**
   * START of Graql specific syntax highlighting
  */
  GRAQL_KEYWORDS = {
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
  };

  GRAQL_METHODS = {
    className: 'graql-method',
    // must remain alphabetically sorted
    variants: [
      { begin: /\bexecute\b/ },
      { begin: /\bgraql\b/ },
      { begin: /\bmap\b/ },
      { begin: /\bquery\b/ },
      { begin: /\bclose\b/ }
    ]
  };

  GRAQL_CLASSES = {
    className: 'graql-class',
    // must remain alphabetically sorted
    variants: [
      { begin: /\bGrakn\b/ },
      { begin: /\bQueryBuilder\b/ },
      { begin: /\bTxType.READ\b/ },
      { begin: /\bTxType.WRITE\b/ }
    ]
  }
  /** END of Graql specific syntax highlighting */

  var IDENT_RE = '[A-Za-z$_][0-9A-Za-z$_]*';
  var KEYWORDS = {
    keyword:
      'in of if for while finally var new function do return void else break catch ' +
      'instanceof with throw case default try this switch continue typeof delete ' +
      'let yield const export super debugger as async await static ' +
      // ECMAScript 6 modules import
      'import from as'
    ,
    literal:
      'true false null undefined NaN Infinity',
    built_in:
      'eval isFinite isNaN parseFloat parseInt decodeURI decodeURIComponent ' +
      'encodeURI encodeURIComponent escape unescape Object Function Boolean Error ' +
      'EvalError InternalError RangeError ReferenceError StopIteration SyntaxError ' +
      'TypeError URIError Number Math Date String RegExp Array Float32Array ' +
      'Float64Array Int16Array Int32Array Int8Array Uint16Array Uint32Array ' +
      'Uint8Array Uint8ClampedArray ArrayBuffer DataView JSON Intl arguments require ' +
      'module console window document Symbol Set Map WeakSet WeakMap Proxy Reflect ' +
      'Promise'
  };
  var NUMBER = {
    className: 'number',
    variants: [
      { begin: '\\b(0[bB][01]+)' },
      { begin: '\\b(0[oO][0-7]+)' },
      { begin: hljs.C_NUMBER_RE }
    ],
    relevance: 0
  };
  var SUBST = {
    className: 'subst',
    begin: '\\$\\{', end: '\\}',
    keywords: KEYWORDS,
    contains: []  // defined later
  };
  var TEMPLATE_STRING = {
    className: 'string',
    begin: '`', end: '`',
    contains: [
      hljs.BACKSLASH_ESCAPE,
      SUBST
    ]
  };
  SUBST.contains = [
    hljs.APOS_STRING_MODE,
    hljs.QUOTE_STRING_MODE,
    TEMPLATE_STRING,
    NUMBER,
    hljs.REGEXP_MODE
  ]
  var PARAMS_CONTAINS = SUBST.contains.concat([
    hljs.C_BLOCK_COMMENT_MODE,
    hljs.C_LINE_COMMENT_MODE
  ]);

  return {
    aliases: ['js', 'jsx'],
    keywords: KEYWORDS,
    contains: [
      GRAQL_KEYWORDS,
      GRAQL_METHODS,
      GRAQL_CLASSES,
      {
        className: 'meta',
        relevance: 10,
        begin: /^\s*['"]use (strict|asm)['"]/
      },
      {
        className: 'meta',
        begin: /^#!/, end: /$/
      },
      hljs.APOS_STRING_MODE,
      hljs.QUOTE_STRING_MODE,
      TEMPLATE_STRING,
      hljs.C_LINE_COMMENT_MODE,
      hljs.C_BLOCK_COMMENT_MODE,
      NUMBER,
      { // object attr container
        begin: /[{,]\s*/, relevance: 0,
        contains: [
          {
            begin: IDENT_RE + '\\s*:', returnBegin: true,
            relevance: 0,
            contains: [{ className: 'attr', begin: IDENT_RE, relevance: 0 }]
          }
        ]
      },
      { // "value" container
        begin: '(' + hljs.RE_STARTERS_RE + '|\\b(case|return|throw)\\b)\\s*',
        keywords: 'return throw case',
        contains: [
          hljs.C_LINE_COMMENT_MODE,
          hljs.C_BLOCK_COMMENT_MODE,
          hljs.REGEXP_MODE,
          {
            className: 'function',
            begin: '(\\(.*?\\)|' + IDENT_RE + ')\\s*=>', returnBegin: true,
            end: '\\s*=>',
            contains: [
              {
                className: 'params',
                variants: [
                  {
                    begin: IDENT_RE
                  },
                  {
                    begin: /\(\s*\)/,
                  },
                  {
                    begin: /\(/, end: /\)/,
                    excludeBegin: true, excludeEnd: true,
                    keywords: KEYWORDS,
                    contains: PARAMS_CONTAINS
                  }
                ]
              }
            ]
          },
          { // E4X / JSX
            begin: /</, end: /(\/\w+|\w+\/)>/,
            subLanguage: 'xml',
            contains: [
              { begin: /<\w+\s*\/>/, skip: true },
              {
                begin: /<\w+/, end: /(\/\w+|\w+\/)>/, skip: true,
                contains: [
                  { begin: /<\w+\s*\/>/, skip: true },
                  'self'
                ]
              }
            ]
          }
        ],
        relevance: 0
      },
      {
        className: 'function',
        beginKeywords: 'function', end: /\{/, excludeEnd: true,
        contains: [
          hljs.inherit(hljs.TITLE_MODE, { begin: IDENT_RE }),
          {
            className: 'params',
            begin: /\(/, end: /\)/,
            excludeBegin: true,
            excludeEnd: true,
            contains: PARAMS_CONTAINS
          }
        ],
        illegal: /\[|%/
      },
      {
        begin: /\$[(.]/ // relevance booster for a pattern common to JS libs: `$(something)` and `$.something`
      },
      /** this line below causes a conflict with syntax highlighting for GRAQL_METHODS */
      // hljs.METHOD_GUARD,
      { // ES6 class
        className: 'class',
        beginKeywords: 'class', end: /[{;=]/, excludeEnd: true,
        illegal: /[:"\[\]]/,
        contains: [
          { beginKeywords: 'extends' },
          hljs.UNDERSCORE_TITLE_MODE
        ]
      },
      {
        beginKeywords: 'constructor', end: /\{/, excludeEnd: true
      }
    ],
    illegal: /#(?!!)/
  };
});
