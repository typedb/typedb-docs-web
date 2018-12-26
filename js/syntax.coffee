---
---

window.syntax_applyHighlighting = ->
    ## the line below is required to force initHighlighting
    ## to be recalled on each turobilink visit
    hljs.initHighlighting.called = false
    hljs.configure({ languages: [] })
    hljs.initHighlighting()

window.syntax_fix = ->
    $(".hljs-method").each ->
        content = $(this).html()
        ## Paranthese must not be highlighted as method
        indexOfParenthese = content.indexOf("(")

        if indexOfParenthese > 0
            noParantheseContent = content.slice(0, indexOfParenthese)
            noParantheseContent += "<span style='color: #F2BD59; display: inline-block;'>(</span>"
            $(this).html(noParantheseContent)

        ## If all uppercase, it's a constant, not a method
        if content == content.toUpperCase()
            $(this).removeClass("hljs-method").addClass("hljs-constant")

