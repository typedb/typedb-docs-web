---
---
window.util_unwrapParagraphInCode = ->
    $('code').each ->
        if $(this).children('p').length > 0
            content = $(this).find('p').html()
            $(this).html content

window.util_handleLinks = ->
    ## adds anchor links for the given tags
    # anchors.options = { icon: "/f0c1/" }
    anchors.add('h2,h3,h4,h5')

    $("#o-content").on "click", "a", (e) ->
        link = e.target
        href = $(link).attr("href")
        ## external links to open in a new tab
        if href.indexOf("http") > -1
            $(link).attr("target", "_blank")
        else if (href[0] == "#" or href[0] == "/")
            ## anchored links to ignore turbolinks (turbolinks ignores css's :target fix)
            $(link).attr("data-turbolinks", "false")

window.util_handleURLParams = () ->
    url_string = window.location.href
    url = new URL(url_string)

    tab = url.searchParams.get("tab")

    if tab
        $(".tabs-list li").removeClass "active"
        $(".tabs-list li.tab-#{tab}").addClass "active"
        $(".tab-pane").removeClass "active"
        $(".tab-pane.#{tab}").addClass "active"

window.util_escapeSpecialChars = () ->
    content = $("#o-content").html()
    content = content.replace(/&amp;lt;/g, "&lt;").replace(/&amp;gt;/g, "&gt;")
    $("#o-content").html(content)