/*
Language: Java
Author: Vsevolod Solovyov <vsevolod.solovyov@gmail.com>
Category: common, enterprise
*/
hljs.registerLanguage("java", function (e) {
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
      { begin: /\bwhere\b/ }
    ]
  };

  GRAQL_METHODS = {
    className: 'graql-method',
    // must remain alphabetically sorted
    variants: [
      { begin: /\bexecute\b/ },
      { begin: /\bgraql\b/ },
      { begin: /\bmap\b/ },
      { begin: /\bsession\b/ },
      { begin: /\btransaction\b/ },
      { begin: /\bclose\b/ }
    ]
  };

  GRAQL_CLASSES = {
    className: 'graql-class',
    // must remain alphabetically sorted
    variants: [
      { begin: /\bGrakn\b/ },
      { begin: /\bKeyspace\b/ },
      { begin: /\bQueryBuilder\b/ },
      { begin: /\bSession\b/ },
      { begin: /\bSimpleURI\b/ },
      { begin: /\bTransaction\b/ },
      { begin: /\bTxType.READ\b/ },
      { begin: /\bTxType.WRITE\b/ }
    ]
  }
  /** END of Graql specific syntax highlighting */

  var JAVA_IDENT_RE = '[\u00C0-\u02B8a-zA-Z_$][\u00C0-\u02B8a-zA-Z_$0-9]*';
  var GENERIC_IDENT_RE = JAVA_IDENT_RE + '(<' + JAVA_IDENT_RE + '(\\s*,\\s*' + JAVA_IDENT_RE + ')*>)?';
  var KEYWORDS =
    'false synchronized int abstract float private char boolean var static null if const ' +
    'for true while long strictfp finally protected import native final void ' +
    'enum else break transient catch instanceof byte super volatile case assert short ' +
    'package default double public try this switch continue throws protected public private ' +
    'module requires exports do';

  // https://docs.oracle.com/javase/7/docs/technotes/guides/language/underscores-literals.html
  var JAVA_NUMBER_RE = '\\b' +
    '(' +
    '0[bB]([01]+[01_]+[01]+|[01]+)' + // 0b...
    '|' +
    '0[xX]([a-fA-F0-9]+[a-fA-F0-9_]+[a-fA-F0-9]+|[a-fA-F0-9]+)' + // 0x...
    '|' +
    '(' +
    '([\\d]+[\\d_]+[\\d]+|[\\d]+)(\\.([\\d]+[\\d_]+[\\d]+|[\\d]+))?' +
    '|' +
    '\\.([\\d]+[\\d_]+[\\d]+|[\\d]+)' +
    ')' +
    '([eE][-+]?\\d+)?' + // octal, decimal, float
    ')' +
    '[lLfF]?';
  var JAVA_NUMBER_MODE = {
    className: 'number',
    begin: JAVA_NUMBER_RE,
    relevance: 0
  };

  return {
    aliases: ['jsp'],
    keywords: KEYWORDS,
    illegal: /<\/|#/,
    contains: [
      GRAQL_KEYWORDS,
      GRAQL_METHODS,
      GRAQL_CLASSES,
      hljs.COMMENT(
        '/\\*\\*',
        '\\*/',
        {
          relevance: 0,
          contains: [
            {
              // eat up @'s in emails to prevent them to be recognized as doctags
              begin: /\w+@/, relevance: 0
            },
            {
              className: 'doctag',
              begin: '@[A-Za-z]+'
            }
          ]
        }
      ),
      hljs.C_LINE_COMMENT_MODE,
      hljs.C_BLOCK_COMMENT_MODE,
      hljs.APOS_STRING_MODE,
      hljs.QUOTE_STRING_MODE,
      {
        className: 'class',
        beginKeywords: 'class interface', end: /[{;=]/, excludeEnd: true,
        keywords: 'class interface',
        illegal: /[:"\[\]]/,
        contains: [
          { beginKeywords: 'extends implements' },
          hljs.UNDERSCORE_TITLE_MODE
        ]
      },
      {
        // Expression keywords prevent 'keyword Name(...)' from being
        // recognized as a function definition
        beginKeywords: 'new throw return else',
        relevance: 0
      },
      {
        className: 'function',
        begin: '(' + GENERIC_IDENT_RE + '\\s+)+' + hljs.UNDERSCORE_IDENT_RE + '\\s*\\(', returnBegin: true, end: /[{;=]/,
        excludeEnd: true,
        keywords: KEYWORDS,
        contains: [
          {
            begin: hljs.UNDERSCORE_IDENT_RE + '\\s*\\(', returnBegin: true,
            relevance: 0,
            contains: [hljs.UNDERSCORE_TITLE_MODE]
          },
          {
            className: 'params',
            begin: /\(/, end: /\)/,
            keywords: KEYWORDS,
            relevance: 0,
            contains: [
              hljs.APOS_STRING_MODE,
              hljs.QUOTE_STRING_MODE,
              hljs.C_NUMBER_MODE,
              hljs.C_BLOCK_COMMENT_MODE
            ]
          },
          hljs.C_LINE_COMMENT_MODE,
          hljs.C_BLOCK_COMMENT_MODE
        ]
      },
      JAVA_NUMBER_MODE,
      {
        className: 'meta', begin: '@[A-Za-z]+'
      }
    ]
  };
});
