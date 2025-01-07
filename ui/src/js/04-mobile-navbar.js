(function() {
    "use strict";

    const navButton = document.querySelector(".nav-toggle-button");
    const nav = document.querySelector(".nav");
    if (!navButton || !nav) return;

    navButton.addEventListener("click", (ev) => {
        document.documentElement.classList.toggle("is-clipped--navbar");
        nav.classList.toggle("nav-opened");
        navButton.classList.toggle("nav-opened");
    });
})();
