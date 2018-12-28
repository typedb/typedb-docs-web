---
---

ready = ->
    ## HACK! we need to find another workaround for having the default index.html
    ## synced in / and docs/
    if ["/", "/docs/"].includes window.location.pathname
        $(".summary").hide()
        window.location = "/docs/general/quickstart"
    window.sidebar_retainScrollPosition()
    window.sidebar_retainActiveState()
    window.topbar_setup()
    window.parser_tabs()
    window.parser_slideshow()
    window.parser_caption()
    window.parser_notes()
    window.parser_kgms()
    window.util_unwrapParagraphInCode()
    window.util_handleLinks()
    window.util_handleURLParams()
    window.util_escapeSpecialChars()
    window.footer_handleSubscribe()
    window.footer_fetchLatestVersion()
    window.syntax_applyHighlighting()
    window.syntax_fix()
    window.util_autoLinkKeywords("code")

handleBeforeTurbolinkVisit = ->
    window.sidebar_storeScrollPosition()

$(document).on 'turbolinks:load', ready
$(document).on "turbolinks:before-visit", () -> handleBeforeTurbolinkVisit()
