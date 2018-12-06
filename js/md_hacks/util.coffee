---
---

window.util_autoLinkKeywords = (selector, keywordLinkMapping) ->
    keywords = Object.keys keywordLinkMapping

    $(selector).each ->
        content = $(this).html()
        for keyword, ki in keywords
            endIndex = 0
            while((beginIndex = content.indexOf(keyword, endIndex)) > -1)
                endIndex = beginIndex + keyword.length
                keywordIsAlreadyLinked = content.slice(endIndex, endIndex + 4) == "</a>"
                keywordIsNotCodeButHref = (content.substr(0, beginIndex).split('href').length > 1 && content.substr(0, beginIndex).split('href').slice(-1)[0].indexOf(" ") == -1)
                unless keywordIsAlreadyLinked || keywordIsNotCodeButHref
                    replacement = "<a href='#{keywordLinkMapping[keyword]}'>#{keyword}</a>"
                    content = content.substr(0, beginIndex) + "<a href='#{keywordLinkMapping[keyword]}'>#{keyword}</a>" + content.substr(endIndex)
                    endIndex = beginIndex + replacement.length
        $(this).html content

window.util_unwrapPinCode = () ->
    $('code').each ->
        if $(this).children('p').length > 0
            content = $(this).find('p').html()
            $(this).html content