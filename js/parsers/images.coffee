---
---

window.parser_caption = ->
    $('img').each ->
        if $(this).parent("p").length
            content = $(this).parent("p").html()
            indexOfCaption = content.indexOf("[caption:")
            if indexOfCaption > -1
                caption = content.slice(indexOfCaption).split(":")[1].slice(0, -1)
                contentWithCaption = content.slice(0, indexOfCaption)
                contentWithCaption += "<p class='caption'>#{$(marked(caption)).addClass("caption").html()}</p>"
                $(this).parent("p").html(contentWithCaption)
