---
---

$(document).on "click", ".a-section_title", (e) -> expandSection(e)
$(document).on "click", ".a-section_item a", (e) -> openPage(e)

window.sidebar_retainScrollPosition = ->
    if window.sidebar_overflow == "scroll"
        $("#o-sidebar").scrollTop(window.sidebar_scroll_top_position)
    else
        $(window).scrollTop(window.sidebar_scroll_top_position)

window.sidebar_storeScrollPosition = ->
    window.sidebar_overflow = $("#o-sidebar").css("overflow-y")
    if sidebar_overflow == "scroll"
        window.sidebar_scroll_top_position = $("#o-sidebar").scrollTop()
    else
        window.sidebar_scroll_top_position = $("#o-sidebar").outerHeight()

window.sidebar_retainActiveState = ->
    $(".a-section_item.active").parents(".o-section").removeClass("active").removeClass("expanded")
    $(".a-section_item.active").removeClass("active")
    currentItem = $(".a-section_item a[href='#{window.location.pathname}']")
    currentItem.parent(".a-section_item").addClass("active")
    currentItem.parents(".o-section").addClass("active").addClass("expanded")

expandSection = (e) ->
    e.preventDefault()
    $(e.target).parents(".o-section").toggleClass("expanded")

openPage = (e) ->
    e.preventDefault()
    $(".o-section.active").removeClass("active")
    $(e.target).parents(".o-section").toggleClass("active")

    $(".a-section_item.active").removeClass("active")
    $(e.target).parent(".a-section_item").addClass("active")

    Turbolinks.visit($(e.target).attr("href"))