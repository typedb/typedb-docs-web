---
---

window.parser_labels = ->
    content = $("#o-content").html()
    labelRegex = /\[(.*)\]/

    loop
        matchedLabel = labelRegex.exec(content)

        if matchedLabel and Object.keys(coloredLabels).includes(matchedLabel[1])
            foundLabel = matchedLabel[1]
            details = coloredLabels[foundLabel]
            labelTag = "<a href='#{details.url}'" +
                        " class='colored-badge' style='background-color: #{details.color}'>" +
                            foundLabel +
                        "</a>"
            content = content.replace(matchedLabel[0], labelTag)
        else
            break
    $("#o-content").html(content)