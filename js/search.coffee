---
---

window.search_init = ->
    $('#searchbar input').on "keyup", (e) ->
        value = $(this).val()

        if e.keyCode == 27 or !this.value
            hideResults()
        else if e.keyCode == 13
            search(value)

    $('#clearSearchBtn').on "click", -> hideResults()

search = (value) ->
    console.log(value)
    $.get "https://grakn.ai/searchDocs?q=" + value, (response, status) ->
        console.log(response, status)
        if status == "success"
            if response.items
                showResults(response.items)
            else
                showNoResults(value)

            if response.spelling
                hintSpelling(response.spelling)

showResults = (items) ->
    results = ""
    for item in items
        results += "<a href='#{item.link}'>" +
                   "    <div class='m-searchItem'>" +
                   "        <p class='a-searchItem-title' href='#{item.link}'>" +
                                item.htmlTitle +
                   "        </p>" +
                   "        <p class='a-searchItem-description'>" +
                                item.htmlSnippet.replace(/\<br\>/g, "") +
                   "        </p>" +
                   "    </div>" +
                   "</a>"

    $('body').css('overflow', 'hidden')
    $('#searchResults .container').html(results)
    $('#searchResults').show()
    $('#clearSearchBtn').show()

hintSpelling = (spelling) ->
    $('#searchResults .container').prepend(
        "<p style='margin: 10px 31px;'>Perhaps you meant to search for:  " +
            "<a id='correctedSearchVal' href='#'>" +
                spelling.htmlCorrectedQuery +
            "</a>" +
        "</p>"
    )

    $('#correctedSearchVal').on "click", (e) ->
        e.preventDefault()
        $('#searchbar input').val(spelling.correctedQuery)
        search(spelling.correctedQuery)


showNoResults = (value) ->
    noResultsMessage = "<p class='a-noResultMessage'>No results found for '#{value}'</p>"
    $('#searchResults .container').html(noResultsMessage)
    $('#searchResults').show()
    $('#clearSearchBtn').show()

hideResults = () ->
    $('body').css('overflow-y', 'scroll')
    $('#searchbar input').val("")
    $('#searchResults').hide()
    $('#clearSearchBtn').hide()