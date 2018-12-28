---
---

window.parser_slideshow = () ->
    $('.slideshow').each (index) ->
        fullContent = $(this).html()
        slides = fullContent.split "[slide:end]"
        slides.pop()
        headers = []
        bodies = []
        footers = []

        for slide in slides
            headers.push slide.split("[header:end]")[0].split("[header:start]")[1]
            bodies.push slide.split("[body:end]")[0].split(["body:start]"])[1]
            footers.push slide.split("[footer:end]")[0].split(["footer:start]"])[1]

        content = "<div id='slideshow_#{index}' class='o_slideshow'>"
        content += "    <i class='a_slide-previous disabled fa fa-chevron-left'></i>"
        for i in [0...headers.length]
            content += "<div class='o_slide #{if i == 0 then "active" else ""}'>"
            content += "    <div class='m_slide-header'>"
            if headers[i]
                content += marked(headers[i])
            content += "    </div>"
            content += "    <div class='m_slide-body'>"
            content += marked(bodies[i])
            content += "    </div>"
            if footers[i]
                content += "    <div class='m_slide-footer'>"
                content += marked(footers[i])
                content += "    </div>"
            content += "</div>"
        content += "    <i class='a_slide-next fa fa-chevron-right'></i>"
        content += "</div>"
        $(this).replaceWith content

    $(document).on "click", ".a_slide-next", ->
        unless $(this).hasClass "disabled"
            activeSlide = $(this).siblings(".o_slide.active")
            activeSlide.removeClass "active"
            nextSlide = activeSlide.next(".o_slide")
            nextSlide.addClass "active"
            unless nextSlide.next(".o_slide").length
                $(this).addClass "disabled"
            $(this).siblings(".a_slide-previous").removeClass "disabled"

    $(document).on "click", ".a_slide-previous", ->
        unless $(this).hasClass "disabled"
            activeSlide = $(this).siblings(".o_slide.active")
            activeSlide.removeClass "active"
            previousSlide = activeSlide.prev(".o_slide")
            previousSlide.addClass "active"
            unless previousSlide.prev(".o_slide").length
                $(this).addClass "disabled"
            $(this).siblings(".a_slide-next").removeClass "disabled"