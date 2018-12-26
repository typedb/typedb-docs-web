/**
 * Used to extend highlighjs syntax highlighters for:
 * java
 * javascript
 * python
 */

CUSTOM_HIGHLIGHT_CLASSES = {
  className: 'class',
  variants: [
    {
      begin: /\=\snew/,
      end: /\<\>|\(\)|\s|\;/,
      excludeBegin: true,
      excludeEnd: true
    },
    {
      begin: /\b[A-Z][a-z]*([A-Z][a-z]*)*\b/
    }
  ]
};

CUSTOM_HIGHLIGHT_METHODS = {
  className: 'method',
  variants: [
    {
      begin: /\./,
      end: /[();\s=\.}]/,
      excludeBegin: true,
      excludeEnd: true
    },
    {
      begin: /[A-Za-z_-]+[^\s]\(/,
      excludeBegin: false,
      excludeEnd: true
    }
  ]
};

CUSTOM_HIGHLIGHT_CONSTANT = {
  className: 'constant',
  begin: /\b[A-Z]+/,
  end: /\)|\.|\s/,
  excludeEnd: true
};