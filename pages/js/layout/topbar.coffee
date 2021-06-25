---
---
window.topbar_setup = ->
    $("#hamburger-btn").click ->
        if ($("#mobile-menu").hasClass("open"))
            setTimeout ->
                $("#mobile-menu").addClass("invisible")
            , 500
        else
            $("#mobile-menu").removeClass("invisible")
        $("#mobile-menu").toggleClass "open"
