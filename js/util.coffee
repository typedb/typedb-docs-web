---
---
codeKeywordsToLink = {
    commonBaseUrl: "/docs/client-api/" + "{language}"
    keywords: [
        ## superset keywords that need to be linked first. example: undefine before define
        {
            titles: ["undefine"]
            allowed: ["method"]
            anchor: "#client-api-method-manipulate-the-schema-programatically"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/schema/concepts"
            titles: ["undefine"]
            allowed: ["graql-keyword", "string"]
            anchor: "#undefine"
            languages: ["graql", "javascript", "python"]
        },
        # {
        #     titles: ["keyspaces().delete"]
        #     # allowed: ["method"]
        #     anchor: "#client-api-method-deleting-a-keyspace"
        #     languages: ["java", "javascript", "python"]
        # },
        {
            titles: ["getAttributesByValue", "get_attributes_by_value"]
            allowed: ["method"]
            anchor: "#client-api-method-retrive-an-attribute-by-value"
            languages: ["javascript", "python"]
        },
        {
            titles: ["getConcept", "get_concept"]
            allowed: ["method"]
            anchor: "#client-api-method-retrive-a-concept-by-id"
            languages: ["javascript", "python"]
        },
        {
            titles: ["getSchemaConcept", "get_schema_concept"]
            allowed: ["method"]
            anchor: "#client-api-method-retrive-a-schema-concept-by-label"
            languages: ["javascript", "python"]
        },
        {
            titles: ["getSchemaConcept", "get_schema_concept"]
            allowed: ["method"]
            anchor: "#client-api-method-retrive-a-schema-concept-by-label"
            languages: ["javascript", "python"]
        },
        {
            titles: ["queryPattern", "query_pattern"]
            allowed: ["method"]
            anchor: "#client-api-method-retrieve-a-graql-explanation-of-the-answer"
            languages: ["javascript", "python"]
        },
        ## retain alphabetic order based on title
        {
            titles: ["aggregate"]
            allowed: ["method"]
            anchor: "#client-api-method-aggregatd-values"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/aggregate-query"
            titles: ["aggregate"]
            allowed: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["answerIterator", "answer_iterator", "Iterator", "iterator"]
            anchor: "#client-api-title-iterator"
            languages: ["javascript", "python"]
        },
        {
            titles: ["answers"]
            allowed: ["method"]
            anchor: "#client-api-method-retrieve-source-facts-of-inference"
            languages: ["javascript", "python"]
        },
        {
            titles: ["collectConcepts", "collect_concepts"]
            allowed: ["method"]
            anchor: "#client-api-method-consume-the-iterator-eagerly"
            languages: ["javascript", "python"]
        },
        {
            titles: ["commit"]
            allowed: ["method"]
            anchor: "#client-api-method-commite-a-write-transaction"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["compute"]
            allowed: ["method"]
            anchor: "#client-api-method-compute-values"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/compute-query"
            titles: ["compute"]
            allowed: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["ConceptMap", "concept_map", "conceptMap"]
            anchor: "#client-api-title-conceptmap"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["define"]
            allowed: ["method"]
            anchor: "#client-api-method-manipulate-the-schema-programatically"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/schema/concepts"
            titles: ["define"]
            allowed: ["graql-keyword", "string"]
            anchor: "#define"
            languages: ["graql", "javascript", "python"]
        },
        # {
        #     titles: ["delete"]
        #     allowed: ["method"]
        #     anchor: "#client-api-method-deleting-data-instances"
        #     languages: ["java"]
        # },
        {
            baseUrl: "/docs/query/delete-query"
            titles: ["delete"]
            allowed: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["explanation"]
            allowed: ["method"]
            anchor: "#client-api-title-explanation"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["execute"]
            allowed: ["method"]
            anchor: "#client-api-method-eager-executation-of-a-graql-query"
            languages: ["java"]
        },
        {
            titles: ["get"]
            allowed: ["method"]
            anchor: "#client-api-method-retrive-data-instances"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/get-query"
            titles: ["get"]
            allowed: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["Graql"]
            allowed: ["class"]
            anchor: "#client-api-title-graql"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/delete-query"
            titles: ["delete"]
            allowed: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            baseUrl: "/docs/query/insert-query"
            titles: ["insert"]
            allowed: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["insert"]
            allowed: ["method"]
            anchor: "#client-api-method-inserte-data-instances"
            languages: ["java"]
        },
        {
            titles: ["keyspaces().retrieve"]
            allowed: ["method"]
            anchor: "#client-api-method-retrieve-all-keyspaces"
            languages: ["javascript", "python"]
        },
        {
            titles: ["match"]
            allowed: ["method"]
            anchor: "#client-api-method-match-patterns-in-data"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/match-clause"
            titles: ["match"]
            allowed: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["measurement"]
            allowed: ["method"]
            anchor: "#client-api-method-retrieve-the-numeric-value-of-a-centrality-computation"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["owner"]
            allowed: ["method"]
            anchor: "#client-api-method-retrieve-the-concept-that-is-the-group-owner"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["putAttributeType", "put_attribute_type"]
            allowed: ["method"]
            anchor: "#client-api-method-create-or-retrieve-an-attributetype"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["putEntityType", "put_entity_type"]
            allowed: ["method"]
            anchor: "#client-api-method-create-or-retrieve-an-entitytype"
            languages: ["javascript", "python"]
        },
        {
            titles: ["putRelationshipType", "put_relationship_type"]
            allowed: ["method"]
            anchor: "#client-api-method-create-or-retrieve-a-relationshiptype"
            languages: ["javascript", "python"]
        },
        {
            titles: ["putRole", "put_role"]
            allowed: ["method"]
            anchor: "#client-api-method-create-or-retrieve-a-role"
            languages: ["javascript", "python"]
        },
        {
            titles: ["putRule", "put_rule"]
            allowed: ["method"]
            anchor: "#client-api-method-create-or-retrieve-a-rule"
            languages: ["javascript", "python"]
        },
        {
            titles: ["query"]
            allowed: ["method"]
            anchor: "#client-api-method-lazily-execute-a-graql-query"
            languages: ["javascript", "python"]
        },
        {
            baseUrl: "/docs/schema/rules"
            allowed: ["graql-keyword"]
            titles: ["rule"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["session"]
            allowed: ["method"]
            anchor: "#client-api-method-create-a-session-keyspace"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["stream"]
            allowed: ["method"]
            anchor: "#client-api-method-lazy-executation-of-a-graql-query"
            languages: ["java"]
        },
        {
            titles: ["transaction"]
            allowed: ["method"]
            anchor: "#client-api-method-create-a-transaction"
            languages: ["java", "javascript", "python"]
        }
        {
            titles: ["withTx"]
            allowed: ["method"]
            anchor: "#client-api-method-attach-transaction-to-query"
            languages: ["java"]
        },
    ]
}

window.util_autoLinkKeywords = (selector) ->
    commonBaseUrl = codeKeywordsToLink.commonBaseUrl
    for mapping, a in codeKeywordsToLink.keywords
        for title, b in mapping.titles
            for lang, c in mapping.languages
                $(selector + ".language-lang-" + lang).each ->
                    baseUrl = mapping.baseUrl || commonBaseUrl
                    url = baseUrl.replace("{language}", lang) + mapping.anchor
                    content = $(this).html()
                    endIndex = 0
                    searchKeyword = (mapping.begin || "") + title + (mapping.end || "")
                    while((beginIndex = content.indexOf(searchKeyword, endIndex)) > -1)
                        className = content.substr(0, beginIndex).split('<span class="hljs-').pop().split('"')[0]

                        endIndex = beginIndex + title.length
                        keywordIsAlreadyLinked = content.slice(endIndex, endIndex + 4) == "</a>"
                        keywordIsHref = (content.substr(0, beginIndex).split('href').length > 1 && content.substr(0, beginIndex).split('href').slice(-1)[0].indexOf(" ") == -1)
                        isAllowed = if mapping.allowed then mapping.allowed.includes(className) else true
                        if !keywordIsAlreadyLinked && !keywordIsHref && isAllowed
                            replacement = "<a href='#{url}'>#{title}</a>"
                            content = content.substr(0, beginIndex) + "<a href='#{url}'>#{title}</a>" + content.substr(endIndex)
                            endIndex = beginIndex + replacement.length
                    $(this).html content

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
                console.log href
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
                window.location = href.split("#")[0] +
                                  (if href.split("#")[0].indexOf("?") == -1 then sourceParams else sourceParams.replace("?", "&"))
                                  sourceParams + (if href.split("#")[1] then "#" +
                                  href.split("#")[1] else "")

window.util_handleURLParams = () ->
    url_string = window.location.href
    url = new URL(url_string)

    lang = url.searchParams.get("lang")

    if lang
        $(".tabs li").removeClass "active"
        $(".tabs li.tab-#{lang}").addClass "active"
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