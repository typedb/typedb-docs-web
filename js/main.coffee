---
---

ready = ->
    currentPage = window.location.pathname.replace('/docs/', '')
    window.track_visit(currentPage)
    window.cookies_handleBanner()
    window.sidebar_retainScrollPosition()
    window.sidebar_retainActiveState()
    window.topbar_setup()
    window.search_init()

    window.parser_tabs()
    window.parser_slideshow()
    window.parser_caption()
    window.parser_notes()
    window.parser_labels()
    window.util_unwrapParagraphInCode()
    window.util_handleLinks()
    window.util_handleURLParams()
    window.util_escapeSpecialChars()
    window.footer_handleSubscribe()
    window.footer_fetchLatestVersion()
    window.syntax_applyHighlighting()
    window.syntax_generateGenericSpan()
    window.autoLinkKeywords_generate()

handleBeforeTurbolinkVisit = ->
    window.sidebar_storeScrollPosition()

$(document).on 'turbolinks:load', ready
$(document).on "turbolinks:before-visit", () -> handleBeforeTurbolinkVisit()
