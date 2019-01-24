---
---

window.parser_kgms = ->
    kgmsLabel = '<a href="https://grakn.ai/grakn-kgms"' +
                ' class="kgms-badge">KGMS Only</a>'
    content = $("#o-content").html()
    content = content.replace /\[KGMS ONLY\]/g, kgmsLabel
    $("#o-content").html(content)