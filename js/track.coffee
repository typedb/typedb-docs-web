---
---

window.track_visit = ->
    $.post "https://grakn.ai/track?",
        {
            "platform": "documentation",
            "action": "visit",
            "utk": $.cookie('hubspotutk')
        }