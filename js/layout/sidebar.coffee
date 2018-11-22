---
---

ready = ->
    if sidebar_overflow == "scroll"
        $("#o-sidebar").scrollTop(sidebar_scroll_top_position)
    else
        console.log(sidebar_scroll_top_position)
        $(window).scrollTop(sidebar_scroll_top_position)

$(document).on 'turbolinks:load', ready

$(document).on "click", ".a-section_title", (e) ->
    e.preventDefault()
    $(this).parents(".o-section").toggleClass("expanded")
    console.log "click"

$(document).on "click", ".a-section_item a", (e) ->
    e.preventDefault()
    $(".o-section.active").removeClass("active")
    $(this).parents(".o-section").toggleClass("active")

    $(".a-section_item.active").removeClass("active")
    $(this).parent(".a-section_item").addClass("active")

    Turbolinks.visit($(this).attr("href"))

sidebar_scroll_top_position = 0;
sidebar_overflow = ""
$(document).on "turbolinks:before-visit", (e) ->
    sidebar_overflow = $("#o-sidebar").css("overflow-y")
    if sidebar_overflow == "scroll"
        sidebar_scroll_top_position = $("#o-sidebar").scrollTop();
    else
        sidebar_scroll_top_position = $("#o-sidebar").outerHeight();