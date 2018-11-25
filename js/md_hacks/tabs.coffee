---
---

window.tabs_parseMarkdown = ->
    $('.tabs').each (index) ->
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
            content = marked(content) ## converting the markdown content to html
            contents.push content

        tab_title_html = '<ul class="tabs">'
        tab_width_percent = 100 / titles.length
        for title, i in titles
            tab_title_html += "<li class='#{"active" if i == 0}' style='width:#{tab_width_percent}%'><a href='##{title + index}' data-toggle='tab'>#{title}</a></li>"
        tab_title_html += '</ul>'

        tab_content_html = '<div class="tab-content">'
        i = 0
        for content, i in contents
            tab_content_html += "<div role='tabpane' class='tab-pane #{"active" if i == 0}' id='#{titles[i] + index}'> #{content}</div>"
        tab_content_html += "</div>"

        $(this).replaceWith tab_title_html + tab_content_html