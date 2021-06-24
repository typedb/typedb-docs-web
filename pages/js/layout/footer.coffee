---
---
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
		$('#download_footer').html 'TypeDB ' + latest_version
