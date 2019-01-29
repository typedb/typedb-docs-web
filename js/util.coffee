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
        else if (href[0] == "#" or href[0] == "/") and $(link).attr("id") != "backToSourceLink"
            ## anchored links to ignore turbolinks (turbolinks ignores css's :target fix)
            $(link).attr("data-turbolinks", "false")
            e.preventDefault()
            if href[0] == "#"
                ## local anchored links to scroll to target rather than jump
                targetId = href.split('#')[1]
                target = $("#" + targetId)
                $('html, body').stop().animate({
                    scrollTop: target.offset().top - 70
                }, 500)
                location.hash = targetId
            if href[0] == "/"
                ## internal links include source params
                ## for the implementation of Back to <previous page> button
                source = window.location.pathname
                if $(link).parent().is("p")
                    heading = $(link).parent("p").prevAll("h1, h2, h3, h4")[0]
                else if $(link).parent().is("h1, h2, h3, h4")
                    heading = $(link).parent("h1, h2, h3, h4")
                pageTitle = $(document).find("title").text().split(" |")[0]
                sourceParams =  "?source=#{window.location.pathname}" +
                                "&sourceAnchor=#{$(heading).attr("id")}" +
                                "&sourceTitle=#{pageTitle}"

                newLocation = href.split("#")[0]

                if href.split("#")[0].indexOf("?") == -1
                    newLocation += sourceParams
                else
                    newLocation += sourceParams.replace("?", "&") + sourceParams

                if href.split("#")[1]
                    newLocation += "#" + href.split("#")[1]

                window.location = newLocation

window.util_handleURLParams = () ->
    url_string = window.location.href
    url = new URL(url_string)

    lang = url.searchParams.get("lang")

    if lang
        $(".tabs-list li").removeClass "active"
        $(".tabs-list li.tab-#{lang}").addClass "active"
        $(".tab-pane").removeClass "active"
        $(".tab-pane.#{lang}").addClass "active"

    source = url.searchParams.get("source")
    sourceTitle = url.searchParams.get("sourceTitle")
    sourceAnchor = url.searchParams.get("sourceAnchor")

    if source and sourceTitle
        if $(".o-backToSourceButton a").html().indexOf(sourceTitle) == -1
            $(".o-backToSourceButton a").append(" #{sourceTitle}").attr("href", source + (if sourceAnchor then "##{sourceAnchor}" else ""))
        right = ($(window).width() - ($("#o-content").offset().left + $("#o-content").outerWidth()))
        $(".o-backToSourceButton").css("right", right + 20).show()


window.util_escapeSpecialChars = () ->
    content = $("#o-content").html()
    content = content.replace(/&amp;lt;/g, "&lt;").replace(/&amp;gt;/g, "&gt;")
    $("#o-content").html(content)