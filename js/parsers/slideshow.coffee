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
        for i in [0...headers.length]
            content += "<div class='o_slideshow-slide " +
                        "#{if i == 0 then "first active" else ""} " +
                        "#{if i == headers.length - 1 then "last" else ""}'>"
            if headers[i]
                content += "<div class='m_slide-header'>"
                content +=      marked(headers[i])
                content += "</div>"
            content += "    <div class='m_slide-body'>"
            content +=          marked(bodies[i])
            content += "    </div>"
            content += "    <div class='o_slide-nav'>"
            content += "        <div class='m_slide-nav-prev #{if i == 0 then "disabled" else ""}'>"
            content += "            <i class='disabled fa fa-chevron-left'></i>"
            content += "        </div>"
            content += "        <div class='m_slide-nav-next #{if i == headers.length - 1 then "disabled" else ""}'>"
            content += "            <i class='fa fa-chevron-right'></i>"
            content += "        </div>"
            content += "    </div>"
            if footers[i]
                content += "<div class='m_slide-footer'>"
                content +=      marked(footers[i])
                content += "</div>"
            content += "</div>"
        content += "</div>"
        $(this).replaceWith content

    $(document).on "click", ".m_slide-nav-next:not(.disabled)", ->
        $(this).parents(".o_slideshow").find(".o_slideshow-slide").removeClass("active")
        $(this).parents(".o_slideshow-slide").next(".o_slideshow-slide").addClass("active")

    $(document).on "click", ".m_slide-nav-prev:not(.disabled)", ->
        $(this).parents(".o_slideshow").find(".o_slideshow-slide").removeClass("active")
        $(this).parents(".o_slideshow-slide").prev(".o_slideshow-slide").addClass("active")