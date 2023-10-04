(function() {
  const menuButton = document.querySelector("header .tb-hamburger-button");
  menuButton.addEventListener("click", function(e) {
    menuButton.classList.toggle("tb-opened");
    document.querySelector("td-topbar-menu-mobile").toggleAttribute("hidden");
  });

  document
    .querySelectorAll("td-topbar-menu-mobile button.tb-menu-panel-header")
    .forEach(el =>
      el.addEventListener("click", function(event) {
        el.classList.toggle("tm-expanded");
        el.parentElement
          .querySelector("td-topbar-menu-panel-mobile")
          .toggleAttribute("hidden");
      })
    );
})();

let hoveredMenuPanelEl = undefined;
let hoveredMenuItemEl = undefined;

function updateMenuPanelVisibility() {
  Array.from(document.getElementsByTagName("td-topbar-menu-panel")).forEach(
    el => {
      const itemEl = el.parentElement.querySelector(".tb-menu-panel-header");

      if (hoveredMenuPanelEl === el || hoveredMenuItemEl === itemEl) {
        el.removeAttribute("hidden");
      } else {
        el.setAttribute("hidden", "");
      }
    }
  );
}

Array.from(document.getElementsByClassName("tb-menu-panel-header")).forEach(
  el => {
    el.addEventListener("mouseenter", () => {
      hoveredMenuPanelEl = undefined;
      hoveredMenuItemEl = el;
      updateMenuPanelVisibility();
    });
    el.addEventListener("mouseleave", () => {
      if (hoveredMenuItemEl === el) {
        hoveredMenuItemEl = undefined;
      }
      updateMenuPanelVisibility();
    });
  }
);

Array.from(document.getElementsByTagName("td-topbar-menu-panel")).forEach(
  el => {
    el.addEventListener("mouseenter", () => {
      hoveredMenuPanelEl = el;
      hoveredMenuItemEl = undefined;
      updateMenuPanelVisibility();
    });
    el.addEventListener("mouseleave", () => {
      if (hoveredMenuPanelEl === el) {
        hoveredMenuPanelEl = undefined;
      }
      updateMenuPanelVisibility();
    });
  }
);
