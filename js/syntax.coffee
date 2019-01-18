---
---

window.syntax_applyHighlighting = ->
    ## the line below is required to force initHighlighting
    ## to be recalled on each turobilink visit
    hljs.initHighlighting.called = false
    hljs.configure({ languages: [] })
    hljs.initHighlighting()

window.syntax_generateGenericSpan = ->
    $('pre code.hljs').each ->
        content = $(this).html()
        delimeter = "</span>"
        if content.indexOf(delimeter) > -1
            endIndex = 0
            newContent = ""
            while((beginIndex = content.indexOf(delimeter, endIndex)) > -1)
                chunkToPersist = content.slice(endIndex, beginIndex + delimeter.length)
                chunkToWrap = content.slice(beginIndex + delimeter.length).split("<span")[0]
                wrappedChunk = '<span class="hljs-generic">' + chunkToWrap + "</span>"
                newContent += chunkToPersist + wrappedChunk
                endIndex += chunkToPersist.length + chunkToWrap.length
            $(this).html newContent
        else
            $(this).html '<span class="hljs-generic">' + content + "</span>"
