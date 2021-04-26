---
---
window.footer_handleSubscribe = ->
	validateEmail = (email) ->
		re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
		re.test email.toLowerCase()

	$("#footer-subscribe-btn").click ->
		inputValue = $('#footer-subscribe-input').val()
		if validateEmail(inputValue)
			$.post 'https://grakn.ai/invite/mailchimp', email: inputValue

window.footer_fetchLatestVersion = ->
	$.ajax(url: 'https://cms.grakn.ai/api/1.1/tables/version/rows?access_token=m7CBWmCjTog1OcNifMcM1TNlOYuztSyL').done (response) ->
		if response.data.length > 0
			latest_version = response.data.filter(((item) -> item.latest == 'True' and item.product == 'core'))[0].version
		else
			latest_version = ""

		# latest_version = if response.data.length > 0 then response.data.filter(((item) ->
			# item.latest == 'True' and item.product == 'core'
		# ))[0].version else ''
		$('#download_nav_bar').html 'Download ' + latest_version
		$('#download_nav_bar_mobile').html 'Download ' + latest_version
		$('#download_footer').html 'Grakn ' + latest_version
