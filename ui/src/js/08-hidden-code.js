(function () {
  'use strict'

  console.log('Hidden tokens transformation script started.')

  // Helper: Wait until Prism has added tokens to the code block.
  function waitForPrism (code, callback) {
    if (code.querySelector('span.token')) {
      callback()
    } else {
      console.log('Prism has not yet finished highlighting this block; waiting 20ms...')
      setTimeout(function () {
        waitForPrism(code, callback)
      }, 20)
    }
  }

  // Helper: Wrap a line in a hidden-line span.
  function wrapHiddenLine (line) {
    return '<span class="hidden-line">' + addHiddenClassToTokens(line) + '</span>'
  }

  // Helper: Given a line of HTML, add "hidden-token" to every token span.
  function addHiddenClassToTokens (line) {
    var temp = document.createElement('div')
    temp.innerHTML = line
    processNode(temp)
    return temp.innerHTML
  }

  // Recursively process nodes so that:
  //  - Text nodes with non-whitespace are wrapped in a span.hidden-token.
  //  - Elements with the "token" class get the "hidden-token" class added.
  function processNode (node) {
    if (node.nodeType === Node.TEXT_NODE) {
      if (node.textContent.trim() !== '') {
        var span = document.createElement('span')
        span.className = 'hidden-token'
        span.textContent = node.textContent
        node.parentNode.replaceChild(span, node)
      }
      return
    }
    if (node.nodeType === Node.ELEMENT_NODE) {
      if (node.classList && node.classList.contains('token') && !node.classList.contains('hidden-token')) {
        node.classList.add('hidden-token')
      }
      Array.from(node.childNodes).forEach(function (child) {
        processNode(child)
      })
    }
  }

  // Process all code blocks using the same selector as the copy-button helper.
  [].slice
    .call(document.querySelectorAll('.doc pre.highlight, .doc .literalblock pre'))
    .forEach(function (pre, index) {
      console.log('Processing code block', index, pre)
      var code = pre.querySelector('code')
      if (!code) {
        console.warn('No <code> element found in code block', index)
        return
      }
      // Only process blocks with language typeql.
      if (code.dataset.lang !== 'typeql') {
        console.log('Skipping code block', index, 'with language', code.dataset.lang)
        return
      }

      // Wait until Prism has finished highlighting.
      waitForPrism(code, function () {
        console.log('Prism finished highlighting block', index)
        // Transform the code's innerHTML.
        var html = code.innerHTML
        var lines = html.split('\n')
        var newLines = []

        for (var i = 0; i < lines.length; i++) {
          var line = lines[i]

          // 1. Replace "#!ordered" marker.
          if (line.indexOf('<span class="token comment">#!ordered</span>') !== -1) {
            console.log('Found #!ordered marker at line', i, 'in block', index)
            newLines.push(
              '<span class="hidden-line"><span class="token hidden-token comment"># Run earlier queries before running this query</span></span>'
            )
            continue
          }

          // 2. Process hidden blocks delimited by "#{{" and "#}}".
          if (line.indexOf('<span class="token comment">#{{</span>') !== -1) {
            console.log('Found hidden block start marker (#{{) at line', i, 'in block', index)
            i++ // Skip the start marker.
            // Process lines until the end marker is found.
            while (i < lines.length && lines[i].indexOf('<span class="token comment">#}}</span>') === -1) {
              newLines.push(wrapHiddenLine(lines[i]))
              i++
            }
            console.log('Found hidden block end marker (#}}) in block', index)
            // Append commit marker wrapped as a hidden line.
            newLines.push(
              '<span class="hidden-line"><span class="token hidden-token comment"># --commit--</span></span>'
            )
            continue
          }

          // 3. Process hidden-lines marker "#!!n"
          var match = line.match(/<span class="token comment">#!!(\d+)<\/span>/)
          if (match) {
            console.log('Found hidden-lines marker (#!!n) at line', i, 'in block', index, 'n =', match[1])
            var n = parseInt(match[1], 10)
            for (var j = 0; j < n; j++) {
              i++
              if (i < lines.length) {
                newLines.push(wrapHiddenLine(lines[i]))
              }
            }
            continue
          }

          // Otherwise, keep the line unchanged.
          newLines.push(line)
        }

        // Build the full transformed content.
        var fullContent = newLines.join('\n')
        // Build the visible version by filtering out any hidden-line.
        var visibleContent = newLines
          .filter(function (line) {
            return line.indexOf('class="hidden-line"') === -1
          })
          .join('\n')

        // Store both versions in data attributes.
        code.dataset.fullContent = fullContent
        code.dataset.visibleContent = visibleContent
        // By default, show the visible version (hidden lines removed).
        code.innerHTML = visibleContent
        console.log('Finished transforming code block', index)

        // Now add the "toggle hidden" button next to the copy button (if any).
        var container = pre.parentNode
        var toolbox = container.querySelector('.source-toolbox')
        if (!toolbox) {
          toolbox = document.createElement('div')
          toolbox.className = 'source-toolbox'
          container.appendChild(toolbox)
          console.log('Created new toolbox for block', index)
        } else {
          console.log('Found existing toolbox for block', index)
        }

        // Create the toggle button.
        var toggle = document.createElement('button')
        toggle.className = 'toggle-hidden-button'
        toggle.setAttribute('title', 'Toggle hidden lines')

        // Create an icon for the toggle button (adjust the SVG as needed).
        var icon = document.createElement('div')
        icon.className = 'toggle-hidden-icon'
        toggle.appendChild(icon)

        toolbox.appendChild(toggle)
        console.log('Appended toggle button to toolbox for block', index)

        // Toggle callback: swap between full content and visible content.
        toggle.addEventListener('click', function () {
          if (pre.classList.contains('show-hidden-lines')) {
            // Currently showing full content; switch to visible version.
            code.innerHTML = code.dataset.visibleContent
            pre.classList.remove('show-hidden-lines')
            console.log('Hidden lines removed for block', index)
          } else {
            // Currently hidden; re-add full content.
            code.innerHTML = code.dataset.fullContent
            pre.classList.add('show-hidden-lines')
            console.log('Hidden lines restored for block', index)
          }
        })
      })
    })
})()
