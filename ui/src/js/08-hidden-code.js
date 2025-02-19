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

  // Use the same selector as the copy-button helper.
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
              '<span class="token hidden-token comment"># Run earlier queries before running this query</span>'
            )
            continue
          }

          // 2. Process hidden blocks delimited by "#{{" and "#}}".
          if (line.indexOf('<span class="token comment">#{{</span>') !== -1) {
            console.log('Found hidden block start marker (#{{) at line', i, 'in block', index)
            i++ // Skip the start marker.
            // Process lines until the end marker is found.
            while (i < lines.length && lines[i].indexOf('<span class="token comment">#}}</span>') === -1) {
              newLines.push(addHiddenClassToTokens(lines[i]))
              i++
            }
            console.log('Found hidden block end marker (#}}) in block', index)
            // Append commit marker.
            newLines.push('<span class="token hidden-token comment"># --commit--</span>')
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
                newLines.push(addHiddenClassToTokens(lines[i]))
              }
            }
            continue
          }

          // Otherwise, keep the line unchanged.
          newLines.push(line)
        }
        // Replace the code block content with the transformed HTML.
        code.innerHTML = newLines.join('\n')
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
        toggle.setAttribute('title', 'Toggle hidden tokens')

        // Create an icon for the toggle button (adjust the SVG as needed).
        var icon = document.createElement('div')
        icon.className = 'toggle-hidden-icon'
        toggle.appendChild(icon)

        toolbox.appendChild(toggle)
        console.log('Appended toggle button to toolbox for block', index)

        // Toggle the visibility of hidden tokens on click.
        toggle.addEventListener('click', function () {
          pre.classList.toggle('show-hidden-tokens')
          console.log(
            'Toggle clicked for block',
            index,
            'show-hidden-tokens =',
            pre.classList.contains('show-hidden-tokens')
          )
        })
      })
    })

  // Helper: For lines that need to be hidden, process every node so that:
  //   - Any element with a token class gets the "hidden-token" class added.
  //   - Any text node (which might be unwrapped) gets wrapped in a span.hidden-token.
  function addHiddenClassToTokens (line) {
    // Create a temporary container element.
    var temp = document.createElement('div')
    temp.innerHTML = line
    processNode(temp)
    return temp.innerHTML
  }

  function processNode (node) {
    // If the node is a text node and contains non-whitespace text, wrap it.
    if (node.nodeType === Node.TEXT_NODE) {
      if (node.textContent.trim() !== '') {
        var span = document.createElement('span')
        span.className = 'hidden-token'
        span.textContent = node.textContent
        node.parentNode.replaceChild(span, node)
      }
    }
    // If the node is an element node:
    if (node.nodeType === Node.ELEMENT_NODE) {
      // If this element is already a token, add the hidden-token class.
      if (node.classList && node.classList.contains('token') && !node.classList.contains('hidden-token')) {
        node.classList.add('hidden-token')
      } else {
        var children = Array.from(node.childNodes)
        children.forEach(function (child) {
          processNode(child)
        })
      }
    }
  }
})()
