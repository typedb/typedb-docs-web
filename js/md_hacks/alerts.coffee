---
---

ready = ->
    convertMarkdownToAlerts()

convertMarkdownToAlerts = ->
    $('.alert').each (index) ->
        alert_components = {
            important: {
                class_name: "warning",
                icon: {
                    name: "star",
                    color: "yellow"
                }
            },
            note: {
                class_name: "info",
                icon: {
                    name: "info-circle",
                    color: "blue"
                }
            }
        }
        alert_detail = $(this).html()
        content = alert_detail.split('\n')
        while(content[0] == "")
            content.shift() ## remove blank elements from head
        title = content[0].slice(1, -1) ## [alername] becomes alername
        content.shift() ## removing first (title) element
        content = content.join('\n') ## reconstructing the tab content
        content = marked(content) ## converting the markdown content to html
        console.log(alert_components[title.toLowerCase()]["class_name"])
        content_html = 
            "<div class='alert alert-#{alert_components[title.toLowerCase()]["class_name"]}' role='alert'>" +
                "<li class='fa fa-#{alert_components[title.toLowerCase()]["icon"]["name"]} fa-#{alert_components[title.toLowerCase()]["icon"]["color"]}' style='margin-right: 5px;'></li>" +
                "<b>#{title}</b>" +
                content +
            "</div>"

        $(this).replaceWith content_html
    hljs.configure({
      classPrefix: 'language-'
    })
    hljs.initHighlighting();

$(document).on 'turbolinks:load', ready