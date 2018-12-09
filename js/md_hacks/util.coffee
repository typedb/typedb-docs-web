---
---
codeKeywordsToLink = {
    commonBaseUrl: "/docs/client-api/" + "{language}"
    keywords: [
        ## superset keywords that need to be linked first. example: undefine before define
        {
            titles: ["undefine"]
            allowed: ["method"]
            anchor: "#client-api-method-manipulating-the-schema-programatically"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/schema/concepts"
            titles: ["undefine"]
            allowed: ["graql-keyword", "string"]
            anchor: "#undefine"
            languages: ["graql", "nodejs", "python"]
        },
        # {
        #     titles: ["keyspaces().delete"]
        #     # allowed: ["method"]
        #     anchor: "#client-api-method-deleting-a-keyspace"
        #     languages: ["java", "nodejs", "python"]
        # },
        {
            titles: ["getAttributesByValue", "get_attributes_by_value"]
            allowed: ["method"]
            anchor: "#client-api-method-retriving-an-attribute-by-value"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["getConcept", "get_concept"]
            allowed: ["method"]
            anchor: "#client-api-method-retriving-a-concept-by-id"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["getSchemaConcept", "get_schema_concept"]
            allowed: ["method"]
            anchor: "#client-api-method-retriving-a-schema-concept-by-label"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["getSchemaConcept", "get_schema_concept"]
            allowed: ["method"]
            anchor: "#client-api-method-retriving-a-schema-concept-by-label"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["queryPattern", "query_pattern"]
            allowed: ["method"]
            anchor: "#client-api-method-retrieving-a-graql-explanation-of-the-answer"
            languages: ["nodejs", "python"]
        },
        ## retain alphabetic order based on title
        {
            titles: ["aggregate"]
            allowed: ["method"]
            anchor: "#client-api-method-aggregating-values"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/aggregate-query"
            titles: ["aggregate"]
            allowed: ["graql-keyword", "string"]
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
            allowed: ["method"]
            anchor: "#client-api-method-retrieving-deducted/factual-answers"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["answers"]
            allowed: ["method"]
            anchor: "#client-api-method-retrieving-deducted/factual-answers"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["collectConcepts", "collect_concepts"]
            allowed: ["method"]
            anchor: "#client-api-method-consuming-the-iterator-eagerly"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["commit"]
            allowed: ["method"]
            anchor: "#client-api-method-committing-a-write-transaction"
            languages: ["java", "nodejs", "python"]
        },
        {
            titles: ["compute"]
            allowed: ["method"]
            anchor: "#client-api-method-computing-values"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/compute-query"
            titles: ["compute"]
            allowed: ["graql-keyword", "string"]
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
            allowed: ["method"]
            anchor: "#client-api-method-manipulating-the-schema-programatically"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/schema/concepts"
            titles: ["define"]
            allowed: ["graql-keyword", "string"]
            anchor: "#define"
            languages: ["graql", "nodejs", "python"]
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
            languages: ["graql", "nodejs", "python"]
        },
        {
            titles: ["explanation"]
            allowed: ["method"]
            anchor: "#client-api-title-explanation"
            languages: ["java", "nodejs", "python"]
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
            anchor: "#client-api-method-retriving-data-instances"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/get-query"
            titles: ["get"]
            allowed: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "nodejs", "python"]
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
            languages: ["graql", "nodejs", "python"]
        },
        {
            baseUrl: "/docs/query/insert-query"
            titles: ["insert"]
            allowed: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "nodejs", "python"]
        },
        {
            titles: ["insert"]
            allowed: ["method"]
            anchor: "#client-api-method-inserting-data-instances"
            languages: ["java"]
        },
        {
            titles: ["keyspaces().retrieve"]
            allowed: ["method"]
            anchor: "#client-api-method-retrieving-all-keyspaces"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["match"]
            allowed: ["method"]
            anchor: "#client-api-method-matching-patterns-in-data"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/match-clause"
            titles: ["match"]
            allowed: ["graql-keyword", "string"]
            anchor: ""
            languages: ["graql", "nodejs", "python"]
        },
        {
            titles: ["measurement"]
            allowed: ["method"]
            anchor: "#client-api-method-retrieving-the-numeric-value-of-a-centrality-computation"
            languages: ["java", "nodejs", "python"]
        },
        {
            titles: ["owner"]
            allowed: ["method"]
            anchor: "#client-api-method-retrieving-the-concept-that-is-the-group-owner"
            languages: ["java", "nodejs", "python"]
        },
        {
            titles: ["putAttributeType", "put_attribute_type"]
            allowed: ["method"]
            anchor: "#client-api-method-creating-or-retrieving-an-attributetype"
            languages: ["java", "nodejs", "python"]
        },
        {
            titles: ["putEntityType", "put_entity_type"]
            allowed: ["method"]
            anchor: "#client-api-method-creating-or-retrieving-an-entitytype"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["putRelationshipType", "put_relationship_type"]
            allowed: ["method"]
            anchor: "#client-api-method-creating-or-retrieving-a-relationshiptype"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["putRole", "put_role"]
            allowed: ["method"]
            anchor: "#client-api-method-creating-or-retrieving-a-role"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["putRule", "put_rule"]
            allowed: ["method"]
            anchor: "#client-api-method-creating-or-retrieving-a-rule"
            languages: ["nodejs", "python"]
        },
        {
            titles: ["query"]
            allowed: ["method"]
            anchor: "#client-api-method-lazy-executation-of-a-graql-query"
            languages: ["nodejs", "python"]
        },
        {
            baseUrl: "/docs/schema/rules"
            allowed: ["graql-keyword"]
            titles: ["rule"]
            anchor: ""
            languages: ["graql", "nodejs", "python"]
        },
        {
            titles: ["session"]
            allowed: ["method"]
            anchor: "#client-api-method-creating-a-session"
            languages: ["java", "nodejs", "python"]
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
            anchor: "#client-api-method-creating-a-transaction"
            languages: ["java", "nodejs", "python"]
        }
        {
            titles: ["withTx"]
            allowed: ["method"]
            anchor: "#client-api-method-attaching-transaction-to-query"
            languages: ["java"]
        },
    ]
}

window.util_autoLinkKeywords = (selector) ->
    commonBaseUrl = codeKeywordsToLink.commonBaseUrl
    for mapping, a in codeKeywordsToLink.keywords
        for title, b in mapping.titles
            for lang, c in mapping.languages
                $(selector + ".language-" + lang).each ->
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
                        console.log isAllowed, className, title
                        if !keywordIsAlreadyLinked && !keywordIsHref && isAllowed
                            replacement = "<a href='#{url}'>#{title}</a>"
                            content = content.substr(0, beginIndex) + "<a href='#{url}'>#{title}</a>" + content.substr(endIndex)
                            endIndex = beginIndex + replacement.length
                    $(this).html content

window.util_unwrapParagraphInCode = () ->
    $('code').each ->
        if $(this).children('p').length > 0
            content = $(this).find('p').html()
            $(this).html content

window.util_handleLinks = () ->
    ## adds anchor links for the given tags
    anchors.add('h2,h3,h4,h5');

    $('a').each ->
        ## external links to open in a new tab
        if $(this).attr("href").indexOf("http") > -1
            $(this).attr("target", "_blank")
        ## anchored links to ignore turbolinks (turbolinks ignores css's :target fix)
        if $(this).attr("href").indexOf("#") > -1
            $(this).attr("data-turbolinks", "false")