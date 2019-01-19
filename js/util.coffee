---
---
codeKeywordsToLink = {
    commonBaseUrl: "/docs/client-api/" + "{language}"
    keywords: [
        ## superset keywords that need to be linked first. example: undefine before define
        {
            titles: ["undefine"]
            anchor: "#client-api-method-manipulate-the-schema-programatically"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/schema/concepts"
            titles: ["undefine"]
            allowedClasses: ["graql-keyword", "string"]
            anchor: "#undefine"
            languages: ["graql", "nodejs", "python"]
        },
        # {
        #     titles: ["keyspaces().delete"]
        #     anchor: "#client-api-method-deleting-a-keyspace"
        #     languages: ["java", "nodejs", "python"]
        # },
        {
            titles: ["getAttributesByValue", "get_attributes_by_value"]
            anchor: "#client-api-method-retrive-an-attribute-by-value"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["getConcept", "get_concept"]
            anchor: "#client-api-method-retrive-a-concept-by-id"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["getSchemaConcept", "get_schema_concept"]
            anchor: "#client-api-method-retrive-a-schema-concept-by-label"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["getSchemaConcept", "get_schema_concept"]
            anchor: "#client-api-method-retrive-a-schema-concept-by-label"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["queryPattern", "query_pattern"]
            anchor: "#client-api-method-retrieve-a-graql-explanation-of-the-answer"
            languages: ["nodejs", "python"]
        },
        ## retain alphabetic order based on title
        {
            titles: ["aggregate"]
            anchor: "#client-api-method-aggregatd-values"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/aggregate-query"
            titles: ["aggregate"]
            allowedClasses: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "nodejs", "python"]
        },
        {
            titles: ["answerIterator", "answer_iterator", "Iterator", "iterator"]
            anchor: "#client-api-title-iterator"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["answers"]
            anchor: "#client-api-method-retrieve-source-facts-of-inference"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["collectConcepts", "collect_concepts"]
            anchor: "#client-api-method-consume-the-iterator-eagerly"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["commit"]
            anchor: "#client-api-method-commit-a-write-transaction"
            languages: ["java", "nodejs", "python"]
        },
        {
            titles: ["compute"]
            anchor: "#client-api-method-compute-values"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/compute-query"
            titles: ["compute"]
            allowedClasses: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "nodejs", "python"]
        },
        {
            titles: ["ConceptMap", "concept_map", "conceptMap"]
            anchor: "#client-api-title-conceptmap"
            languages: ["java", "nodejs", "python"]
        },
        {
            titles: ["define"]
            anchor: "#client-api-method-manipulate-the-schema-programatically"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/schema/concepts"
            titles: ["define"]
            allowedClasses: ["graql-keyword", "string"]
            anchor: "#define"
            languages: ["graql", "nodejs", "python"]
        },
        # {
        #     titles: ["delete"]
        #
        #     anchor: "#client-api-method-deleting-data-instances"
        #     languages: ["java"]
        # },
        {
            baseUrl: "/docs/query/delete-query"
            titles: ["delete"]
            allowedClasses: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "nodejs", "python"]
        },
        {
            titles: ["explanation"]
            anchor: "#client-api-title-explanation"
            languages: ["java", "nodejs", "python"]
        },
        {
            titles: ["execute"]
            anchor: "#client-api-method-eager-executation-of-a-graql-query"
            languages: ["java"]
        },
        {
            titles: ["get"]
            anchor: "#client-api-method-retrive-data-instances"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/get-query"
            titles: ["get"]
            allowedClasses: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "nodejs", "python"]
        },
        {
            titles: ["Graql"]
            anchor: "#client-api-title-graql"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/delete-query"
            titles: ["delete"]
            allowedClasses: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "nodejs", "python"]
        },
        {
            baseUrl: "/docs/query/insert-query"
            titles: ["insert"]
            allowedClasses: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "nodejs", "python"]
        },
        {
            titles: ['insert']
            anchor: "#client-api-method-insert-data-instances"
            languages: ["java"]
        },
        {
            titles: ["keyspaces().retrieve"]
            anchor: "#client-api-method-retrieve-all-keyspaces"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["match"]
            anchor: "#client-api-method-match-patterns-in-data"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/match-clause"
            titles: ["match"]
            allowedClasses: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "nodejs", "python"]
        },
        {
            titles: ["measurement"]
            anchor: "#client-api-method-retrieve-the-numeric-value-of-a-centrality-computation"
            languages: ["java", "nodejs", "python"]
        },
        {
            titles: ["owner"]

            anchor: "#client-api-method-retrieve-the-concept-that-is-the-group-owner"
            languages: ["java", "nodejs", "python"]
        },
        {
            titles: ["putAttributeType", "put_attribute_type"]
            anchor: "#client-api-method-create-or-retrieve-an-attributetype"
            languages: ["java", "nodejs", "python"]
        },
        {
            titles: ["putEntityType", "put_entity_type"]
            anchor: "#client-api-method-create-or-retrieve-an-entitytype"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["putRelationshipType", "put_relationship_type"]
            anchor: "#client-api-method-create-or-retrieve-a-relationshiptype"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["putRole", "put_role"]
            anchor: "#client-api-method-create-or-retrieve-a-role"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["putRule", "put_rule"]
            anchor: "#client-api-method-create-or-retrieve-a-rule"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["query"]
            anchor: "#client-api-method-lazily-execute-a-graql-query"
            languages: ["nodejs", "python"]
        },
        {
            baseUrl: "/docs/schema/rules"
            allowedClasses: ["graql-keyword"]
            titles: ["rule"]
            anchor: ""
            languages: ["graql", "nodejs", "python"]
        },
        {
            titles: ["session"]
            anchor: "#client-api-method-create-a-session-keyspace"
            languages: ["java", "nodejs", "python"]
        },
        {
            titles: ["stream"]
            anchor: "#client-api-method-lazy-executation-of-a-graql-query"
            languages: ["java"]
        },
        {
            titles: ["transaction"]
            anchor: "#client-api-method-create-a-transaction"
            languages: ["java", "nodejs", "python"]
        }
        {
            titles: ["withTx"]
            anchor: "#client-api-method-attach-transaction-to-query"
            languages: ["java"]
        },
    ]
}

window.util_autoLinkKeywords = (selector) ->
    commonBaseUrl = codeKeywordsToLink.commonBaseUrl

    for mapping, a in codeKeywordsToLink.keywords
        baseUrl = mapping.baseUrl || commonBaseUrl

        for lang, b in mapping.languages
            url = baseUrl.replace("{language}", lang) + mapping.anchor
            allowedClasses = mapping.allowedClasses || ["generic"]

            for allowedClass, c in allowedClasses
                allowedClass = "hljs-" + allowedClass
                $(".language-lang-" + lang + " ." + allowedClass).each ->
                    content = $(this).html()

                    for title, d in mapping.titles
                        regexedTitle = "(^|[\.\<\(])(" + title + ")([\.\>\(\s])"
                        regexedTitle = new RegExp(regexedTitle, "g")
                        content = content.replace(regexedTitle, "$1<a href='#{url}'>#{title}</a>$3")
                    $(this).html(content)

window.util_unwrapParagraphInCode = ->
    $('code').each ->
        if $(this).children('p').length > 0
            content = $(this).find('p').html()
            $(this).html content

window.util_handleLinks = ->
    ## adds anchor links for the given tags
    # anchors.options = { icon: "/f0c1/" }
    anchors.add('h2,h3,h4,h5')

    $("#o-content").on "click", "a", (e) ->
        link = e.target
        href = $(link).attr("href")
        ## external links to open in a new tab
        if href.indexOf("http") > -1
            $(link).attr("target", "_blank")
        else if (href[0] == "#" or href[0] == "/") and $(link).attr("id") != "backToSourceLink"
            ## anchored links to ignore turbolinks (turbolinks ignores css's :target fix)
            $(link).attr("data-turbolinks", "false")
            e.preventDefault()
            if href[0] == "#"
                ## local anchored links to scroll to target rather than jump
                targetId = href.split('#')[1]
                target = $("#" + targetId)
                $('html, body').stop().animate({
                    scrollTop: target.offset().top - 70
                }, 500)
                location.hash = targetId
            if href[0] == "/"
                ## internal links include source params
                ## for the implementation of Back to <previous page> button
                source = window.location.pathname
                if $(link).parent().is("p")
                    heading = $(link).parent("p").prevAll("h1, h2, h3, h4")[0]
                else if $(link).parent().is("h1, h2, h3, h4")
                    heading = $(link).parent("h1, h2, h3, h4")
                pageTitle = $(document).find("title").text().split(" |")[0]
                sourceParams =  "?source=#{window.location.pathname}" +
                                "&sourceAnchor=#{$(heading).attr("id")}" +
                                "&sourceTitle=#{pageTitle}"

                newLocation = href.split("#")[0]

                if href.split("#")[0].indexOf("?") == -1
                    newLocation += sourceParams
                else
                    newLocation += sourceParams.replace("?", "&") + sourceParams

                if href.split("#")[1]
                    newLocation += "#" + href.split("#")[1]

                window.location = newLocation

window.util_handleURLParams = () ->
    url_string = window.location.href
    url = new URL(url_string)

    lang = url.searchParams.get("lang")

    if lang
        $(".tabs-list li").removeClass "active"
        $(".tabs-list li.tab-#{lang}").addClass "active"
        $(".tab-pane").removeClass "active"
        $(".tab-pane.#{lang}").addClass "active"

    source = url.searchParams.get("source")
    sourceTitle = url.searchParams.get("sourceTitle")
    sourceAnchor = url.searchParams.get("sourceAnchor")

    if source and sourceTitle
        if $(".o-backToSourceButton a").html().indexOf(sourceTitle) == -1
            $(".o-backToSourceButton a").append(" #{sourceTitle}").attr("href", source + (if sourceAnchor then "##{sourceAnchor}" else ""))
        right = ($(window).width() - ($("#o-content").offset().left + $("#o-content").outerWidth()))
        $(".o-backToSourceButton").css("right", right + 20).show()


window.util_escapeSpecialChars = () ->
    content = $("#o-content").html()
    content = content.replace(/&amp;lt;/g, "&lt;").replace(/&amp;gt;/g, "&gt;")
    $("#o-content").html(content)