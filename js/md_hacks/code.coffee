---
---

window.code_autoLinkKeywords = ->
    keywordLinkMapping = {
        "queryBuilder": "#queryBuilder",
    }
    format = "[--]" ## usage in markdown: [-some-keyword-]

    $("code").each ->
        toBeLinkedIndexBegin = 0
        content = $(this).html()
        while true
            toBeLinkedIndexBegin = content.search(/\[\-.*\-\]/)
            if toBeLinkedIndexBegin > -1
                toBeLinked = content.slice(toBeLinkedIndexBegin + 2, -1).split("-]")[0]
                toBeLinkedIndexEnd = toBeLinkedIndexBegin + toBeLinked.length + format.length
                linkeReplacement = "<a href='#{keywordLinkMapping[toBeLinked]}'>#{toBeLinked}</a>"
                content = content.substring(0, toBeLinkedIndexBegin) + linkeReplacement + content.substring(toBeLinkedIndexEnd);
            else
                break
        $(this).html(content)