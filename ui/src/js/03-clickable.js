(function() {
  "use strict";

  document.querySelectorAll(".clickable").forEach(el => {
    const innerLink = el.querySelector("a");
    if (innerLink) {
      el.addEventListener("click", () => innerLink.click());
    }
  });
})();
