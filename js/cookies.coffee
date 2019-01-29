---
---

window.cookies_handleBanner = () ->
  if localStorage.getItem("user-has-accepted-cookies") == null
    $(".cookie-banner").show()
    $(".cookie-banner .button-close").click ->
      localStorage.setItem("user-has-accepted-cookies", "true")
      $(".cookie-banner").hide()