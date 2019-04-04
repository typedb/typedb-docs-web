---
---

window.track_visit = ->
    $.post "https://grakn.ai/hsengt",
        {
            "platform": "documentation",
            "action": "visit",
            "utk": $.cookie('hubspotutk')
        }