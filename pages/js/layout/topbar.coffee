---
---
window.topbar_setup = ->
    $("#hamburger-btn").click ->
        if ($("#main-menu").hasClass("open"))
            setTimeout ->
                $("#main-menu").addClass("invisible")
            , 500
        else
            $("#main-menu").removeClass("invisible")
        $("#main-menu").toggleClass "open"
