(function() {
  "use strict";
  var production = window.location.href.includes('typedb.com');

  if (production === true) {
    var links = document.querySelectorAll('a[href*="/academy/"]');

    links.forEach(function(link) {
      link.href = link.href.replace('/academy/', '/../academy/');
    });
  }
})()