let hoveredMenuPanelIndex = undefined;
let hoveredMenuItemIndex = undefined;

;(function () {
  let mobileMenuBtn = document.querySelector("button[_ngcontent-bfa-c139]")
  mobileMenuBtn.addEventListener('click', function(e){
    console.log("e",e)
    e.target.closest("button[_ngcontent-bfa-c139]").classList.toggle("tb-opened");
    let topbarMenuMobile = document.querySelector("td-topbar-menu-mobile[_ngcontent-bfa-c139]")
    topbarMenuMobile.toggleAttribute("hidden");


    let atagExpandableList = document.querySelectorAll("a[_ngcontent-bfa-c141]") || []
    console.log("atagExpandable0", atagExpandableList)
    if(atagExpandableList.length>0){
      for(let atag of atagExpandableList){
        atag.addEventListener('click', function(event){
          event.target.classList.toggle("tm-expanded");
          let parent = event.target.parentNode
          let submenu = parent.querySelector("td-topbar-menu-panel-mobile[_ngcontent-bfa-c141]")
          submenu.toggleAttribute("hidden");

        })
      }

    }
  })



})()

function updateMenuPanelVisibility() {
    for (const i of [1, 2, 3]) {
        if ([hoveredMenuItemIndex, hoveredMenuPanelIndex].includes(i)) {
            document.getElementById(`topbarMenuPanel${i}`).removeAttribute('hidden');
        } else {
            document.getElementById(`topbarMenuPanel${i}`).setAttribute('hidden', '');
        }
    }
}

for (const i of [1, 2, 3]) {
    document.getElementById(`topbarMenuItem${i}`).addEventListener('mouseenter', () => {
        hoveredMenuItemIndex = i;
        hoveredMenuPanelIndex = undefined;
        updateMenuPanelVisibility();
    });

    document.getElementById(`topbarMenuItem${i}`).addEventListener('mouseleave', () => {
        if (hoveredMenuItemIndex === i) hoveredMenuItemIndex = undefined;
        updateMenuPanelVisibility();
    });

    document.getElementById(`topbarMenuPanel${i}`).addEventListener('mouseenter', () => {
        hoveredMenuPanelIndex = i;
        hoveredMenuItemIndex = undefined;
        updateMenuPanelVisibility();
    });

    document.getElementById(`topbarMenuPanel${i}`).addEventListener('mouseleave', () => {
        if (hoveredMenuPanelIndex === i) hoveredMenuPanelIndex = undefined;
        updateMenuPanelVisibility();
    });
}
