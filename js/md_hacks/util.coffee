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

window.util_unwrapParagraphInCode = () ->
    $('code').each ->
        if $(this).children('p').length > 0
            content = $(this).find('p').html()
            $(this).html content

window.util_handleLinks = () ->
    ## adds anchor links for the given tags
    anchors.add('h2,h3,h4,h5');

    $('a').each ->
        ## external links to open in a new tab
        if $(this).attr("href").indexOf("http") > -1
            $(this).attr("target", "_blank")
        ## anchored links to ignore turbolinks (turbolinks ignores css's :target fix)
        if $(this).attr("href").indexOf("#") > -1
            console.log $('.anchorjs-link').length
            $(this).attr("data-turbolinks", "false")