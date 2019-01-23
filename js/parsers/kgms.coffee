---
---

window.parser_kgms = ->
    kgmsLabel = '<a href="https://grakn.ai/grakn-kgms"' +
                ' class="badge badge-warning kgms-badge" style="background-color: #efb507; font-size: 80%; color: #fff; text-shadow: 1px 1px 0px rgba(0,0,0,0.6)">KGMS Only</a>'
    content = $("#o-content").html()
    content = content.replace /\[KGMS ONLY\]/g, kgmsLabel
    $("#o-content").html(content)