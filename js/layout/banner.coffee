---
---
window.cookies_handleCosmosBanner = () ->

	shouldHideBanner = $.cookie('closed-cosmos-banner');
	if shouldHideBanner 
		closeBanner()
	else
		showBanner()
	
	$('.banner-cosmos-container').click (e) ->
		if $(e.target).hasClass 'banner-btn-close'
			$.cookie('closed-cosmos-banner', true);
			closeBanner()
		else
			window.open 'https://community.grakn.ai/grakn-orbit-2021'


closeBanner = ->
	$('body').removeClass('banner-showing')
	$('.banner-cosmos-container').hide()

showBanner = ->
	$('body').addClass('banner-showing')
	$('.banner-cosmos-container').show()
