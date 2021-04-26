---
---

window.track_visit = (pageTitle) ->
    $.post "https://grakn.ai/hsengt",
        {
            "utk": $.cookie('hubspotutk'),
            "platform": "documentation",
            "action": "visit",
            "subject": pageTitle
        }