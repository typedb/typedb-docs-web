---
---

window.cookies_handleBanner = () ->
    if getCookie("user-has-accepted-cookies") == ""
        $(".cookie-banner").show()
        $(".cookie-banner .button-close").click ->
            document.cookie = "user-has-accepted-cookies= true"
            $(".cookie-banner").hide()


getCookie = (cname) ->
  name = cname + '='
  decodedCookie = decodeURIComponent(document.cookie)
  ca = decodedCookie.split(';')
  i = 0
  while i < ca.length
    c = ca[i]
    while c.charAt(0) == ' '
      c = c.substring(1)
    if c.indexOf(name) == 0
      return c.substring(name.length, c.length)
    i++
  ''
