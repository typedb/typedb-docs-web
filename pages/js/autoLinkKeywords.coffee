---
---

window.autoLinkKeywords_generate = () ->
    commonBaseUrl = codeKeywordsToLink.commonBaseUrl

    for mapping, a in codeKeywordsToLink.keywords
        baseUrl = mapping.baseUrl || commonBaseUrl

        for lang, b in mapping.languages
            url = baseUrl.replace("{client}", getClientOf(lang)) + mapping.anchor
            syntaxedAsList = mapping.syntaxedAs

            for syntaxedAs, c in syntaxedAsList
                syntaxedAs = ".token." + syntaxedAs
                $(".language-" + lang + " " + syntaxedAs).each ->
                    content = $(this).html()

                    for title, d in mapping.titles
                        if content.trim() == title
                            content = content.replace(title, "<a href='#{url}'>#{title}</a>")
                    $(this).html(content)

getClientOf = (language) ->
    return {
        java: "java"
        javascript: "nodejs"
        python: "python"
    }[language]