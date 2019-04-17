---
---
window.fixedElement_githubEditBtn = ->
    top = $('.o-header').outerHeight()
    right = $('#o-sidebar').offset().left
    right = right + parseInt($('#o-content').css('padding-right').replace("px", ""))/2
    $('#editOnGithub').css({
        top: top + "px",
        right: right + "px"
    })
