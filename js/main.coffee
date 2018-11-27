---
---

ready = ->
    window.sidebar_retainScrollPosition()
    window.navbar_setup()
    window.tabs_parseMarkdown()
    window.alerts_convertMarkdown()
    main_applySyntaxHighlighting()
    window.code_autoLinkKeywords()


sidebar_scroll_top_position = 0;
sidebar_overflow = ""
handleBeforeTurbolinkVisit = ->
    window.sidebar_storeScrollPosition()

window.main_applySyntaxHighlighting = ->
    ## the line below is required to force initHighlighting
    ## to be recalled on each turobilink visit
    hljs.initHighlighting.called = false;
    hljs.initHighlighting()

$(document).on 'turbolinks:load', ready
$(document).on "turbolinks:before-visit", () -> handleBeforeTurbolinkVisit()