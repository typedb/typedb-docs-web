---
---

ready = ->
    convertMarkdownToBootstrapTabs()

convertMarkdownToBootstrapTabs = ->
    $('.tabs').each ->
        titles = []
        contents = []
        tab_details = $(this).html().split('[tab:end]')
        tab_details.pop() ## removing last (empty) element
        for tab_detail in tab_details
            content = tab_detail.split('\n')
            content = content.filter((el) -> el != '') ## removing empty tiems
            title = content[0].split(':')[1].slice(0, -1)
            content.shift() ## removing first (tittle) element
            content = content.join('\n') ## reconstructing the tab content
            titles.push title
            content = marked(content) ## converting the markdown content to html
            contents.push content

        tab_title_html = '<ul class="tabs">'
        for title, i in titles
            tab_title_html += "<li class='#{"active" if i == 0}'><a href='##{title}' data-toggle='tab'>#{title}</a></li>"
        tab_title_html += '</ul>'

        tab_content_html = '<div class="tab-content">'
        i = 0
        for content, i in contents
            tab_content_html += "<div role='tabpane' class='tab-pane #{"active" if i == 0}' id='#{titles[i]}'> #{content}</div>"
        tab_content_html += "</div>"

        $(this).replaceWith tab_title_html + tab_content_html
    hljs.configure({
      classPrefix: 'language-'
    })
    hljs.initHighlighting();

$(document).on 'turbolinks:load', ready