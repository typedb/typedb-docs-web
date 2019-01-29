---
---

window.syntax_applyHighlighting = ->
    Prism.highlightAll(false) ## "false" to run synchronously
    ## so that syntax_generateGenericSpan() runs only after
    ## the syntax highlighting has been applied
    $('pre code').show()

window.syntax_generateGenericSpan = ->
    $("pre code[class*=language-]").each ->
        content = $(this).html()
        delimeter = "</span>"
        newContent = ""

        if content.indexOf(delimeter) > -1
            endIndex = 0
            while((beginIndex = content.indexOf(delimeter, endIndex)) > -1)
                chunkToPersist = content.slice(endIndex, beginIndex + delimeter.length)
                chunkToWrap = content.slice(beginIndex + delimeter.length).split("<span")[0]
                wrappedChunk = '<span class="token custom-generic">' + chunkToWrap + "</span>"
                newContent += chunkToPersist + wrappedChunk
                endIndex += chunkToPersist.length + chunkToWrap.length
            $(this).html newContent
        else
            $(this).html '<span class="token custom-generic">' + content + "</span>"

        ## the while loop above doesn't handle the first unwrapped line in content
        ## the code below handles only that
        if content.slice(0, 5) != "<span"
            splittedContent = content.split("<span")
            chunkToWrap = splittedContent.shift()
            ## splittedContent no longer contains the chunkToWrap
            chunkToPersist = "<span" + splittedContent.join("<span")
            wrappedChunk = '<span class="token custom-generic">' + chunkToWrap + "</span>"
            newContent = wrappedChunk + chunkToPersist
            $(this).html newContent

