/**
 * Contains the Graql syntax highlighter for Prism.
 * Written by Felix
 * Modified by Harjyot
 * Updated (1.4.3) by Soroush
 */

(function () {
    Prism.languages.graql = {
      comment: {
          pattern: /#.*/,
          alias: 'comment'
      },
      string: {
          pattern: /".*?"/,
          alias: 'string'
      },
      keyword: {
          pattern: /((?:(?![-a-zA-Z_0-9]|\$).)|^|\s)(sub|has|key|is-abstract|relates|plays|datatype|boolean|double|long|string|date|match|isa|contains|regex|val|via|id|label|define|undefine|get|insert|delete|aggregate|compute|std|median|mean|max|min|sum|count|group|path|centrality|cluster|degree|k-core|where|from|to|in|of|limit|offset|order by|asc|desc|when|then|commit)(?![-a-zA-Z_0-9])/,
          alias: 'graql-keyword',
          lookbehind: true
      },
      super: {
          pattern: /((?:(?![-a-zA-Z_0-9]|\$).)|^|\s)(entity|role|relationship|attribute|rule|thing)(?![-a-zA-Z_0-9])/,
          alias: 'type',
          lookbehind: true
      },
      special: {
          pattern: /graql>|results>|\.\.\./
      },
      variable: {
          pattern: /\$[-a-zA-Z_0-9]+/,
          alias: 'variable'
      },
      number: {
          pattern: /[0-9]+(\.[0-9][0-9]*)?/,
          alias: 'number'
      },
      operator: {
          pattern: /=|;|\.|\+|\-|\*|,|\(|\)|:|{|}|!=|>|<|>=|<=/,
          alias: 'operator'
      }
    };
    Prism.languages.graql_test = Prism.languages.graql;
  }());