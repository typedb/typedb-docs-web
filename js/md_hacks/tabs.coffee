---
---

window.tabs_parseMarkdown = () ->
    $('.gtabs').each (index) ->
        titles = []
        contents = []
        tab_details = $(this).html().split('[tab:end]')
        tab_details.pop() ## removing last (empty) element
        for tab_detail in tab_details
            content = tab_detail.split('\n')
            while(content[0] == "")
                content.shift() ## remove blank elements from head
            title = content[0].split(':')[1].slice(0, -1)
            content.shift() ## removing first (title) element
            content = content.join('\n') ## reconstructing the tab content
            titles.push title
            content = content.replace(/\\\</g, "<").replace(/\\\>/g, ">")
            content = marked content ## converting the markdown content to html, handling escaped chars manually!
            contents.push content

        isLight = $(this).attr('class').indexOf("light") > -1
        isDark = $(this).attr('class').indexOf("dark") > -1

        tab_title_html = "<ul class='tabs #{if isLight then "light" else ""} #{if isDark then "dark" else ""}'>"
        tab_width_percent = 100 / titles.length
        for title, i in titles
            tab_title_html += "<li class='#{"active" if i == 0}' style='width:#{tab_width_percent}%'><a href='##{title.replace(/\s/g, "-").toLowerCase() + index}' data-toggle='tab'>#{title}</a></li>"
        tab_title_html += '</ul>'

        tab_content_html = "<div class='tab-content #{if isLight then "light" else ""} #{if isDark then "dark" else ""}'>"
        i = 0
        for content, i in contents
            tab_content_html += "<div role='tabpane' class='tab-pane #{"active" if i == 0}' id='#{titles[i].replace(/\s/g, "-").toLowerCase() + index}'> #{content}</div>"
        tab_content_html += "</div>"

        $(this).replaceWith tab_title_html + tab_content_html