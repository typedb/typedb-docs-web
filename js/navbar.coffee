---
---
ready = ->
    hamburgerBtn = $('#hamburger-btn')
    hamburgerMenu = $('#hamburger-menu')
    hamburgerSecondaryMenu = $('#hamburger-menu-secondary')
    hamburgerSecondaryMenuBack = $('#hamburger-menu-secondary-back')
    hamburgerExpanded = false
    secondaryExpanded = null

    hamburgerBtn.click ->
        hamburgerExpanded = !hamburgerExpanded
        if hamburgerExpanded
            hamburgerBtn.addClass 'is-active'
            hamburgerMenu.addClass 'navigation-bar__hamburger--open'
        else
            hamburgerBtn.removeClass 'is-active'
            hamburgerMenu.removeClass 'navigation-bar__hamburger--open'

    hamburgerParentButtons = $('.navigation-bar__link__dropdown')

    hamburgerParentButtons.each (i) ->
        $(this).click ->
            submenu = $(this).find('.navigation-bar__link__dropdown__mobile')
            if secondaryExpanded == i
                secondaryExpanded = null
                submenu.removeClass 'navigation-bar__link__dropdown__mobile--active'
                hamburgerParentButtons.eq(i).find('.fa-caret-down').addClass 'fa-caret-right'
                hamburgerParentButtons.eq(i).find('.fa-caret-right').removeClass 'fa-caret-down'
            else
                if secondaryExpanded
                    hamburgerParentButtons.eq(secondaryExpanded).find('.navigation-bar__link__dropdown__mobile').removeClass 'navigation-bar__link__dropdown__mobile--active'
                    hamburgerParentButtons.eq(secondaryExpanded).find('.fa-caret-down').addClass 'fa-caret-right'
                    hamburgerParentButtons.eq(secondaryExpanded).find('.fa-caret-right').removeClass 'fa-caret-down'
                secondaryExpanded = i
                submenu.addClass 'navigation-bar__link__dropdown__mobile--active'
                hamburgerParentButtons.eq(secondaryExpanded).find('.fa-caret-right').addClass 'fa-caret-down'
                hamburgerParentButtons.eq(secondaryExpanded).find('.fa-caret-down').removeClass 'fa-caret-right'

$(document).on 'turbolinks:load', ready