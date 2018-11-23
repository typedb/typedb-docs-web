/*
Language: Python
Category: common
*/
hljs.registerLanguage("python", function (e) {
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
      { begin: /\bquery\b/ },
      { begin: /\bclose\b/ }
    ]
  };
  /** END of Graql specific syntax highlighting */

  var KEYWORDS = {
    keyword:
      'and elif is global as in if from raise for except finally print import pass return ' +
      'exec else break not with class assert yield try while continue del or def lambda ' +
      'async await nonlocal|10 None True False',
    built_in:
      'Ellipsis NotImplemented'
  };
  var PROMPT = {
    className: 'meta', begin: /^(>>>|\.\.\.) /
  };
  var SUBST = {
    className: 'subst',
    begin: /\{/, end: /\}/,
    keywords: KEYWORDS,
    illegal: /#/
  };
  var STRING = {
    className: 'string',
    contains: [hljs.BACKSLASH_ESCAPE],
    variants: [
      {
        begin: /(u|b)?r?'''/, end: /'''/,
        contains: [hljs.BACKSLASH_ESCAPE, PROMPT],
        relevance: 10
      },
      {
        begin: /(u|b)?r?"""/, end: /"""/,
        contains: [hljs.BACKSLASH_ESCAPE, PROMPT],
        relevance: 10
      },
      {
        begin: /(fr|rf|f)'''/, end: /'''/,
        contains: [hljs.BACKSLASH_ESCAPE, PROMPT, SUBST]
      },
      {
        begin: /(fr|rf|f)"""/, end: /"""/,
        contains: [hljs.BACKSLASH_ESCAPE, PROMPT, SUBST]
      },
      {
        begin: /(u|r|ur)'/, end: /'/,
        relevance: 10
      },
      {
        begin: /(u|r|ur)"/, end: /"/,
        relevance: 10
      },
      {
        begin: /(b|br)'/, end: /'/
      },
      {
        begin: /(b|br)"/, end: /"/
      },
      {
        begin: /(fr|rf|f)'/, end: /'/,
        contains: [hljs.BACKSLASH_ESCAPE, SUBST]
      },
      {
        begin: /(fr|rf|f)"/, end: /"/,
        contains: [hljs.BACKSLASH_ESCAPE, SUBST]
      },
      hljs.APOS_STRING_MODE,
      hljs.QUOTE_STRING_MODE
    ]
  };
  var NUMBER = {
    className: 'number', relevance: 0,
    variants: [
      { begin: hljs.BINARY_NUMBER_RE + '[lLjJ]?' },
      { begin: '\\b(0o[0-7]+)[lLjJ]?' },
      { begin: hljs.C_NUMBER_RE + '[lLjJ]?' }
    ]
  };
  var PARAMS = {
    className: 'params',
    begin: /\(/, end: /\)/,
    contains: ['self', PROMPT, NUMBER, STRING]
  };
  SUBST.contains = [STRING, NUMBER, PROMPT];
  return {
    aliases: ['py', 'gyp', 'ipython'],
    keywords: KEYWORDS,
    illegal: /(<\/|->|\?)|=>/,
    contains: [
      GRAQL_KEYWORDS,
      GRAQL_METHODS,
      PROMPT,
      NUMBER,
      STRING,
      hljs.HASH_COMMENT_MODE,
      {
        variants: [
          { className: 'function', beginKeywords: 'def' },
          { className: 'class', beginKeywords: 'class' }
        ],
        end: /:/,
        illegal: /[${=;\n,]/,
        contains: [
          hljs.UNDERSCORE_TITLE_MODE,
          PARAMS,
          {
            begin: /->/, endsWithParent: true,
            keywords: 'None'
          }
        ]
      },
      {
        className: 'meta',
        begin: /^[\t ]*@/, end: /$/
      },
      {
        begin: /\b(print|exec)\(/ // don’t highlight keywords-turned-functions in Python 3
      }
    ]
  };
});
