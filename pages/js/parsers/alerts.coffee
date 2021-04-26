---
---
window.parser_notes = ->
    $('.note').each (index) ->
        alert_detail = $(this).html()
        content = alert_detail.split('\n')
        while(content[0] == "")
            content.shift() ## remove blank elements from head
        title = content[0].slice(1, -1) ## [alername] becomes alername
        content.shift() ## removing first (title) element
        content = content.join('\n') ## reconstructing the tab content
        content = marked(content) ## converting the markdown content to html

        className = coloredPanels[title.toLowerCase()]["className"]
        color = coloredPanels[title.toLowerCase()]["icon"]["color"]
        icon = coloredPanels[title.toLowerCase()]["icon"]["name"]

        content_html =
            "<div class='alert alert-#{className}' role='alert'>" +
                "<li class='#{icon}' style='margin-right: 5px; color: #{color}'></li>" +
                "<b>#{title}</b>" +
                content +
            "</div>"

        $(this).replaceWith content_html