(function () {
  'use strict'

  const SUPPORTED = ['typeql', 'python', 'rust']

  // --- TypeDB Console Script syntax ---
  const CONSOLE = {
    txn_open: {
      schema: '.transaction schema db_test',
      write: '.transaction write db_test',
      read: '.transaction read db_test',
    },
    send_q: '', // sending a query just adds new line
    commit: '.commit',
    close: '.close',
    comments: {
      failure: {
        attribute: 'fails_at', // Test attribute (see typeql_runner.py)
        comment: 'Will fail.',
      },
      rollback: {
        attribute: 'rollback', // Test attribute (see typeql_runner.py)
        comment: 'Don\'t commit.',
      },
      count: {
        attribute: 'count', // Test attribute (see typeql_runner.py)
        comment: 'Answer count:',
      },
    },
  }

  // --- Keep this synced with typedb-docs: code_test/parser/parser.py ---
  const MARKERS = {
    typeql: {
      test_start: '#!test',
      hidden_segment_start: '#{{',
      hidden_segment_end: '#}}',
      segment_separator: '#---',
      ordered_macro: '#!ordered',
      skip_lines: '#!!',
    },
    python: {
      test_start: '#!test',
      hidden_segment_start: '#{{',
      hidden_segment_end: '#}}',
      segment_separator: '#---',
      ordered_macro: '#!ordered',
      skip_lines: '#!!',
    },
    rust: {
      test_start: '//!test',
      hidden_segment_start: '//{{',
      hidden_segment_end: '//}}',
      segment_separator: '//---',
      ordered_macro: '//!ordered',
      skip_lines: '//!!',
    },
  }

  // 'Enum' for parser logic
  const QueryParserState = {
    NONE: null, // we are not (yet) in a query
    VISIBLE: 'visible', // we are in a visible query
    HIDDEN: 'hidden', // we are in a hidden query
  }

  // Prism is our default syntax highlighter ... we have to wait for it
  // to finish highlighting before we can start hiding code snippets.
  function waitForPrism (code, callback) {
    if (code.querySelector('span.token')) {
      callback()
    } else {
      // console.log('Prism has not yet finished highlighting this block; wait 20ms...')
      setTimeout(function () {
        waitForPrism(code, callback)
      }, 20)
    }
  }

  function hideLine (line) {
    return '<span class="hidden-line">' + line + '</span>'
  }

  function commentStr (str) {
    return '<span class="token comment">' + str + '</span>'
  }

  function consoleStr (str) {
    return '<span class="token console">' + str + '</span>'
  }

  function terminateTxnLine (ongoingTransaction) {
    const failureComment = ongoingTransaction.failure ? CONSOLE.comments.failure.comment : ''
    const rollbackComment = ongoingTransaction.rollback ? CONSOLE.comments.rollback.comment : ''
    const commentStart = (ongoingTransaction.failure || ongoingTransaction.rollback) ? ' # ' : ''
    return hideLine(consoleStr(CONSOLE[ongoingTransaction.ends_with]) + commentStr(commentStart + failureComment + rollbackComment))
  }

  function terminateQueryLine (currentState, resetState) {
    if (currentState === resetState || currentState === QueryParserState.NONE) {
      return null
    } else {
      return hideLine(consoleStr(CONSOLE.send_q))
    }
  }

  [].slice
    .call(document.querySelectorAll('.doc pre.highlight, .doc .literalblock pre'))
    .forEach(function (pre, index) {
      const code = pre.querySelector('code')
      if (!code) {
        console.warn('No <code> element found in code block', index)
        return
      }

      const lang = code.dataset.lang
      if (!SUPPORTED.includes(lang)) {
        // console.log('Skipping code block', index, 'with language', code.dataset.lang)
        return
      }

      waitForPrism(code, function () {
        // console.log('Prism finished highlighting block', index)
        const html = code.innerHTML
        const lines = html.split('\n')
        const formattedLines = []

        // TypeQL-specific parser state
        let queryState = QueryParserState.NONE
        const ongoingTransaction = {
          type: null,
          failure: null,
          rollback: null,
          ends_with: null,
        }

        for (let i = 0; i <= lines.length; i++) {
          if (i === lines.length) {
            if (lang === 'typeql' && ongoingTransaction.type != null) {
              formattedLines.push(hideLine(''))
              formattedLines.push(terminateTxnLine(ongoingTransaction))
            }
            break
          }
          // console.log('Processing line number ' + i)
          const line = lines[i]

          if (line.indexOf(MARKERS[lang].test_start) !== -1) {
            // console.log('Found test start at line', i, 'in block', index)
            if (lang === 'typeql') {
              if (ongoingTransaction.type != null) {
                const terminatingLine = terminateQueryLine(queryState, QueryParserState.NONE)
                if (terminatingLine != null) {
                  formattedLines.push(terminatingLine)
                }
                queryState = QueryParserState.NONE
                formattedLines.push(terminateTxnLine(ongoingTransaction))
                formattedLines.push(hideLine(''))
              }
              const txnTypeMatch = line.match(/^.+?\[(.+?)\b/)
              if (!(txnTypeMatch)) {
                console.warn('Found typeql test without transaction type')
                continue
              }
              if (!(txnTypeMatch[1] in CONSOLE.txn_open)) {
                console.warn('Found typeql test with invalid transaction type')
                continue
              }
              // TODO: parse out answer count test attribute
              ongoingTransaction.type = txnTypeMatch[1]
              ongoingTransaction.failure = (line.indexOf(CONSOLE.comments.failure.attribute) !== -1)
              ongoingTransaction.rollback = (line.indexOf(CONSOLE.comments.rollback.attribute) !== -1)
              ongoingTransaction.ends_with = (ongoingTransaction.failure || ongoingTransaction.rollback || ongoingTransaction.type === 'read') ? 'close' : 'commit'
              formattedLines.push(hideLine(consoleStr(CONSOLE.txn_open[ongoingTransaction.type])))
            }
            continue
          }

          if (line.indexOf(MARKERS[lang].hidden_segment_start) !== -1) {
            // console.log('Found hidden segment start at line', i, 'in block', index)
            if (lang === 'typeql') {
              const terminatingLine = terminateQueryLine(queryState, QueryParserState.NONE)
              if (terminatingLine != null) {
                formattedLines.push(terminatingLine)
              }
              queryState = QueryParserState.HIDDEN
            }
            i++
            while (i < lines.length && lines[i].indexOf(commentStr(MARKERS[lang].hidden_segment_end)) === -1) {
              formattedLines.push(hideLine(lines[i]))
              i++
            }
            // console.log('Found hidden segment end at line', i - 1, 'in block', index)
            continue
          }

          if (line.indexOf(MARKERS[lang].segment_separator) !== -1) {
            // console.log('Found segment separator at line', i, 'in block', index)
            switch (lang) {
              case 'typeql':
                formattedLines.push(hideLine(consoleStr(CONSOLE.send_q)))
                break
              case 'rust':
                formattedLines.push(hideLine(''))
                break
              case 'python':
                formattedLines.push(hideLine(''))
                break
            }
            continue
          }

          if (line.indexOf(MARKERS[lang].ordered_macro) !== -1) {
            // console.log('Found ordered macro at line', i, 'in block', index)
            switch (lang) {
              case 'typeql':
                formattedLines.push(hideLine(commentStr('# Note: Run earlier queries before running this query')))
                break
              case 'rust':
                formattedLines.push(hideLine(commentStr('// Note: Run earlier queries before running this query')))
                break
              case 'python':
                formattedLines.push(hideLine(commentStr('# Note: Run earlier examples before running this example')))
                break
            }
            continue
          }

          var skipLinesMatch = line.match(`${MARKERS[lang].skip_lines}(\\d+)`)
          if (skipLinesMatch) {
            // console.log('Found hidden-lines marker (#!!n) at line', i, 'in block', index, 'n =', skipLinesMatch[1])
            var n = parseInt(skipLinesMatch[1], 10)
            for (var j = 0; j < n; j++) {
              i++
              if (i < lines.length) {
                formattedLines.push(hideLine(lines[i]))
              }
            }
            queryState = true
            continue
          }

          // Otherwise, this line must belong to an actual (visible) query
          if (lang === 'typeql') {
            const terminatingLine = terminateQueryLine(queryState, QueryParserState.VISIBLE)
            if (terminatingLine != null) {
              formattedLines.push(terminatingLine)
            }
            queryState = QueryParserState.VISIBLE
          }
          // console.log('Found #' + i + ' line is visible: ' + line)
          formattedLines.push(line)
        }

        var fullContent = formattedLines.join('\n')
        var visibleContent = formattedLines
          .filter(function (line) {
            return line.indexOf('class="hidden-line"') === -1
          })
          .join('\n')

        code.dataset.fullContent = fullContent
        code.dataset.visibleContent = visibleContent
        code.innerHTML = visibleContent
        // console.log('Finished transforming code block', index)

        var container = pre.parentNode
        var toolbox = container.querySelector('.source-toolbox')
        if (!toolbox) {
          toolbox = document.createElement('div')
          toolbox.className = 'source-toolbox'
          container.appendChild(toolbox)
          // console.log('Created new toolbox for block', index)
        } else {
          // console.log('Found existing toolbox for block', index)
        }

        var toggle = document.createElement('button')
        toggle.className = 'toggle-hidden-button'
        toggle.setAttribute('title', 'Toggle hidden lines')

        var icon = document.createElement('div')
        icon.className = 'toggle-hidden-icon'
        toggle.appendChild(icon)

        toolbox.appendChild(toggle)
        // console.log('Appended toggle button to toolbox for block', index)

        toggle.addEventListener('click', function () {
          if (pre.classList.contains('show-hidden-lines')) {
            code.innerHTML = code.dataset.visibleContent
            pre.classList.remove('show-hidden-lines')
            // console.log('Hidden lines removed for block', index)
          } else {
            code.innerHTML = code.dataset.fullContent
            pre.classList.add('show-hidden-lines')
            // console.log('Hidden lines restored for block', index)
          }
        })
      })
    })
})()
