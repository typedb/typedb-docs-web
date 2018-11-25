---
---
window.navbar_setup = ->
    hamburgerSecondaryMenu = $('#hamburger-menu-secondary')
    hamburgerSecondaryMenuBack = $('#hamburger-menu-secondary-back')
    secondaryExpanded = null

    $("#hamburger-btn").click ->
        $(this).toggleClass "is-active"
        $("#hamburger-menu").toggleClass "navigation-bar__hamburger--open"

    $(".navigation-bar__link__dropdown").click ->
        $(".fa-caret-right").removeClass(".fa-caret-right").addClass(".fa-caret-down")
        $(this).find(".fa-caret-down").removeClass(".fa-caret-down").addClass(".fa-caret-right")

        $(".navigation-bar__link__dropdown__mobile").removeClass("navigation-bar__link__dropdown__mobile--active")
        $(this).find(".navigation-bar__link__dropdown__mobile").addClass("navigation-bar__link__dropdown__mobile--active")


    # hamburgerParentButtons.each (i) ->
    #     $(this).click ->
    #         submenu = $(this).find('.navigation-bar__link__dropdown__mobile')
    #         if secondaryExpanded == i
    #             secondaryExpanded = null
    #             submenu.removeClass 'navigation-bar__link__dropdown__mobile--active'
    #             hamburgerParentButtons.eq(i).find('.fa-caret-down').addClass 'fa-caret-right'
    #             hamburgerParentButtons.eq(i).find('.fa-caret-right').removeClass 'fa-caret-down'
    #         else
    #             if secondaryExpanded
    #                 hamburgerParentButtons.eq(secondaryExpanded).find('.navigation-bar__link__dropdown__mobile').removeClass 'navigation-bar__link__dropdown__mobile--active'
    #                 hamburgerParentButtons.eq(secondaryExpanded).find('.fa-caret-down').addClass 'fa-caret-right'
    #                 hamburgerParentButtons.eq(secondaryExpanded).find('.fa-caret-right').removeClass 'fa-caret-down'
    #             secondaryExpanded = i
    #             submenu.addClass 'navigation-bar__link__dropdown__mobile--active'
    #             hamburgerParentButtons.eq(secondaryExpanded).find('.fa-caret-right').addClass 'fa-caret-down'
    #             hamburgerParentButtons.eq(secondaryExpanded).find('.fa-caret-down').removeClass 'fa-caret-right'