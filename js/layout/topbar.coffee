---
---
window.topbar_setup = ->
    $("#hamburger-btn").click ->
        $(this).toggleClass "is-active"
        $("#hamburger-menu").toggleClass "topbar__hamburger--open"

    $(".topbar__link__dropdown").click ->
        $(".fa-caret-right").removeClass(".fa-caret-right").addClass(".fa-caret-down")
        $(this).find(".fa-caret-down").removeClass(".fa-caret-down").addClass(".fa-caret-right")

        $(".topbar__link__dropdown__mobile").removeClass("topbar__link__dropdown__mobile--active")
        $(this).find(".topbar__link__dropdown__mobile").addClass("topbar__link__dropdown__mobile--active")