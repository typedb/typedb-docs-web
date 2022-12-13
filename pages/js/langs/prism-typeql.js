/**
 * Contains the Graql syntax highlighter for Prism.
 * Written by Felix
 * Modified by Harjyot
 * Updated (1.4.3) by Soroush
 */

(function () {
    Prism.languages.typeql = {
      comment: {
          pattern: /#.*/,
          alias: 'comment'
      },
      string: {
          pattern: /".*?"/,
          alias: 'string'
      },
      keyword: {
          pattern: /((?:(?![-a-zA-Z_0-9]|\$).)|^|\s)(as|sub|sub!|has|owns|@key|abstract|relates|plays|boolean|double|long|string|date|value|match|is|isa|isa!|contains|regex|val|via|iid|label|define|undefine|get|insert|delete|aggregate|std|median|mean|max|min|sum|count|group|where|from|to|in|of|limit|offset|sort|asc|desc|when|then|commit)(?![-a-zA-Z_0-9])/,
          alias: 'typeql-keyword',
          lookbehind: true
      },
      super: {
          pattern: /((?:(?![-a-zA-Z_0-9]|\$).)|^|\s)(entity|role|relation|attribute|rule|thing)(?![-a-zA-Z_0-9])/,
          alias: 'type',
          lookbehind: true
      },
      special: {
          pattern: /typeql>|results>|\.\.\./
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
  }());