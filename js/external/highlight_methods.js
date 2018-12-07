HIGHLIGHT_METHODS = {
    className: 'method',
    variants: [
      { begin: /\./, end: /\(/, excludeBegin: true, excludeEnd: true }
      // { begin: /[\.]aggregate/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]and/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]close/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]commit/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]compute/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]count/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]define/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]delete/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]explanation/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]execute/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]get/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]group/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]has/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]insert/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]isa/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]keyspaces/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]label/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]map/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]match/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]of/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]plays/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]query/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]rel/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]relates/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]session/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]stream/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]sub/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]then/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]toString/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]transaction/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]undefine/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]var\b/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]when/, end: /\(/, excludeEnd: true },
      // { begin: /[\.]withTx/, end: /\(/, excludeEnd: true },
    ]
  };

  HIGHLIGHT_CLASSES = {
    className: 'class',
    variants: [
      { begin: /\b[A-Z][a-z]*([A-Z][a-z]*)*\b/ },
    ]
  };