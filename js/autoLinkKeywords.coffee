---
---
codeKeywordsToLink = {
    commonBaseUrl: "/docs/client-api/" + "{client}"
    keywords: [
        ## superset keywords that need to be linked first. example: undefine before define
        {
            titles: ["undefine"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-manipulate-the-schema-programatically"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/schema/concepts"
            titles: ["undefine"]
            allowedClasses: ["keyword", "string"]
            anchor: "#undefine"
            languages: ["graql", "javascript", "python"]
        },
        # {
        #     titles: ["keyspaces().delete"]
        #     anchor: "#client-api-method-deleting-a-keyspace"
        #     languages: ["java", "javascript", "python"]
        # },
        {
            titles: ["getAttributesByValue", "get_attributes_by_value"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-retrive-an-attribute-by-value"
            languages: ["javascript", "python"]
        },
        {
            titles: ["getConcept", "get_concept"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-retrive-a-concept-by-id"
            languages: ["javascript", "python"]
        },
        {
            titles: ["getSchemaConcept", "get_schema_concept"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-retrive-a-schema-concept-by-label"
            languages: ["javascript", "python"]
        },
        {
            titles: ["getSchemaConcept", "get_schema_concept"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-retrive-a-schema-concept-by-label"
            languages: ["javascript", "python"]
        },
        {
            titles: ["queryPattern", "query_pattern"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-retrieve-a-graql-explanation-of-the-answer"
            languages: ["javascript", "python"]
        },
        ## retain alphabetic order based on title
        {
            titles: ["aggregate"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-aggregatd-values"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/aggregate-query"
            titles: ["aggregate"]
            allowedClasses: ["keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["answerIterator", "answer_iterator", "Iterator", "iterator"]
            allowedClasses: ["custom-generic"]
            anchor: "#client-api-title-iterator"
            languages: ["javascript", "python"]
        },
        {
            titles: ["answers"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-retrieve-source-facts-of-inference"
            languages: ["javascript", "python"]
        },
        {
            titles: ["collectConcepts", "collect_concepts"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-consume-the-iterator-eagerly"
            languages: ["javascript", "python"]
        },
        {
            titles: ["commit"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-commit-a-write-transaction"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["compute"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-compute-values"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/compute-query"
            titles: ["compute"]
            allowedClasses: ["keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["ConceptMap", "concept_map", "conceptMap"]
            allowedClasses: ["custom-generic"]
            anchor: "#client-api-title-conceptmap"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["define"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-manipulate-the-schema-programatically"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/schema/concepts"
            titles: ["define"]
            allowedClasses: ["keyword", "string"]
            anchor: "#define"
            languages: ["graql", "javascript", "python"]
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
            allowedClasses: ["keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["explanation"]
            allowedClasses: ["function"]
            anchor: "#client-api-title-explanation"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["execute"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-eager-executation-of-a-graql-query"
            languages: ["java"]
        },
        {
            titles: ["get"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-retrive-data-instances"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/get-query"
            titles: ["get"]
            allowedClasses: ["keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["Graql"]
            allowedClasses: ["custom-generic"]
            anchor: "#client-api-title-graql"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/delete-query"
            titles: ["delete"]
            allowedClasses: ["keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            baseUrl: "/docs/query/insert-query"
            titles: ["insert"]
            allowedClasses: ["keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ['insert']
            allowedClasses: ["function"]
            anchor: "#client-api-method-insert-data-instances"
            languages: ["java"]
        },
        # {
        #     titles: ["keyspaces().retrieve"]
        #     allowedClasses: ["function"]
        #     anchor: "#client-api-method-retrieve-all-keyspaces"
        #     languages: ["javascript", "python"]
        # },
        {
            titles: ["match"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-match-patterns-in-data"
            languages: ["java"]
        },
        {
            baseUrl: "/docs/query/match-clause"
            titles: ["match"]
            allowedClasses: ["keyword", "string"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["measurement"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-retrieve-the-numeric-value-of-a-centrality-computation"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["owner"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-retrieve-the-concept-that-is-the-group-owner"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["putAttributeType", "put_attribute_type"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-create-or-retrieve-an-attributetype"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["putEntityType", "put_entity_type"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-create-or-retrieve-an-entitytype"
            languages: ["javascript", "python"]
        },
        {
            titles: ["putRelationshipType", "put_relationship_type"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-create-or-retrieve-a-relationshiptype"
            languages: ["javascript", "python"]
        },
        {
            titles: ["putRole", "put_role"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-create-or-retrieve-a-role"
            languages: ["javascript", "python"]
        },
        {
            titles: ["putRule", "put_rule"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-create-or-retrieve-a-rule"
            languages: ["javascript", "python"]
        },
        {
            titles: ["query"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-lazily-execute-a-graql-query"
            languages: ["javascript", "python"]
        },
        {
            baseUrl: "/docs/schema/rules"
            allowedClasses: ["keyword", "string"]
            titles: ["rule"]
            anchor: ""
            languages: ["graql", "javascript", "python"]
        },
        {
            titles: ["session"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-create-a-session-keyspace"
            languages: ["java", "javascript", "python"]
        },
        {
            titles: ["stream"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-lazy-executation-of-a-graql-query"
            languages: ["java"]
        },
        {
            titles: ["transaction"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-create-a-transaction"
            languages: ["java", "javascript", "python"]
        }
        {
            titles: ["withTx"]
            allowedClasses: ["function"]
            anchor: "#client-api-method-attach-transaction-to-query"
            languages: ["java"]
        },
    ]
}

window.autoLinkKeywords_generate = () ->
    commonBaseUrl = codeKeywordsToLink.commonBaseUrl

    for mapping, a in codeKeywordsToLink.keywords
        baseUrl = mapping.baseUrl || commonBaseUrl

        for lang, b in mapping.languages
            url = baseUrl.replace("{client}", getClientOf(lang)) + mapping.anchor
            allowedClasses = mapping.allowedClasses || ["generic"]

            for allowedClass, c in allowedClasses
                allowedClass = ".token." + allowedClass
                $(".language-" + lang + " " + allowedClass).each ->
                    content = $(this).html()

                    for title, d in mapping.titles
                        if content.trim() == title
                            content = content.replace(title, "<a href='#{url}'>#{title}</a>")
                    $(this).html(content)

getClientOf = (language) ->
    return {
        java: "java"
        javascript: "nodejs"
        python: "python"
    }[language]