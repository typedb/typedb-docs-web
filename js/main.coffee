---
---

ready = ->
    window.sidebar_retainScrollPosition()
    window.sidebar_retainActiveState()
    window.topbar_setup()
    window.tabs_parseMarkdown()
    window.slideshow_parseMarkdown()
    window.images_parseCaption()
    window.alerts_parseMarkdown()
    window.util_unwrapParagraphInCode()
    window.util_autoLinkKeywords("code")
    window.util_handleLinks()
    window.util_handleURLParams()
    window.util_escapeSpecialChars()
    window.footer_handleSubscribe()
    window.footer_fetchLatestVersion()
    window.syntax_applyHighlighting()
    window.syntax_fix()

handleBeforeTurbolinkVisit = ->
    window.sidebar_storeScrollPosition()

$(document).on 'turbolinks:load', ready
$(document).on "turbolinks:before-visit", () -> handleBeforeTurbolinkVisit()
# $(document).on 'turbolinks:visit', () -> handleSidebarActiveState()