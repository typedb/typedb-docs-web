---
---

$(document).on "click", ".a-section_title", (e) -> expandSection(e)
$(document).on "click", ".a-section_item a", (e) -> openPage(e)

window.sidebar_retainScrollPosition = ->
    if sidebar_overflow == "scroll"
        $("#o-sidebar").scrollTop(sidebar_scroll_top_position)
    else
        $(window).scrollTop(sidebar_scroll_top_position)

sidebar_scroll_top_position = 0;
sidebar_overflow = ""
window.sidebar_storeScrollPosition = ->
    sidebar_overflow = $("#o-sidebar").css("overflow-y")
    if sidebar_overflow == "scroll"
        sidebar_scroll_top_position = $("#o-sidebar").scrollTop();
    else
        sidebar_scroll_top_position = $("#o-sidebar").outerHeight();

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