---
---

ready = ->
    window.sidebar_retainScrollPosition()
    window.navbar_setup()
    window.tabs_parseMarkdown()
    window.alerts_convertMarkdown()
    main_applySyntaxHighlighting()
    window.util_unwrapPinCode()

    window.util_autoLinkKeywords("language-graql", {
        "undefine": "/docs/schema/concepts#undefine"
        "define": "/docs/schema/concepts#define"
        "get": "/docs/query/get-query"
        "match": "/docs/query/match-clause"
        "rule": "/docs/schema/rules"
    })

    window.util_autoLinkKeywords(".language-java", {
        ## superset keywords that need to be linked first. example: undefine before define
        "undefine": "/docs/client-api/java#client-api-method-manipulating-the-schema-programatically"
        "keyspaces().delete": "/docs/client-api/java#client-api-method-deleting-a-keyspace"
        ## retain alphabetic order
        "aggregate": "/docs/client-api/java#client-api-method-aggregating-values"
        "commit": "/docs/client-api/java#client-api-method-committing-a-write-transaction"
        "compute": "/docs/client-api/java#client-api-method-committing-a-write-transaction"
        "ConceptMap": "/docs/client-api/java#client-api-title-conceptmap"
        "define": "/docs/client-api/java#client-api-method-computing-values"
        "delete": "/docs/client-api/java#client-api-method-deleting-data-instances"
        "execute": "/docs/client-api/java#client-api-method-eager-executation-of-a-graql-query"
        "get": "/docs/client-api/java#client-api-method-retriving-data-instances"
        "Graql": "/docs/client-api/java#client-api-title-graql"
        "match": "/docs/client-api/java#client-api-method-matching-patterns-in-data"
        "session": "/docs/client-api/java#client-api-method-creating-a-session"
        "stream": "/docs/client-api/java#client-api-method-lazy-executation-of-a-graql-query"
        "transaction": "/docs/client-api/java#client-api-title-session"
        "withTx": "/docs/client-api/java#client-api-method-attaching-transaction-to-query"
    })

    window.util_autoLinkKeywords(".language-javascript", {
        ## superset keywords that need to be linked first. example: undefine before define
        "getAttributesByValue": "/docs/client-api/nodejs#client-api-method-retriving-an-attribute-by-value"
        "getConcept": "/docs/client-api/nodejs#client-api-method-retriving-a-concept-by-id"
        "getSchemaConcept": "/docs/client-api/nodejs#client-api-method-retriving-a-schema-concept-by-label"
        "keyspaces().delete": "/docs/client-api/nodejs#client-api-method-deleting-a-keyspace"
        "queryPattern": "/docs/client-api/nodejs#client-api-method-retrieving-a-graql-explanation-of-the-answer"
        "undefine": "/docs/client-api/nodejs#client-api-method-manipulating-the-schema-programatically"
        ## retain alphabetic order
        "aggregate": "/docs/client-api/nodejs#client-api-method-aggregating-values"
        "answers": "/docs/client-api/nodejs#client-api-method-retrieving-deducted/factual-answers"
        "collectConcepts": "/docs/client-api/nodejs#client-api-method-consuming-the-iterator-eagerly"
        "commit": "/docs/client-api/nodejs#client-api-method-committing-a-write-transaction"
        "compute": "/docs/client-api/nodejs#client-api-method-committing-a-write-transaction"
        "define": "/docs/client-api/nodejs#client-api-method-computing-values"
        "delete": "/docs/client-api/nodejs#client-api-method-deleting-data-instances"
        "explanation": "/docs/client-api/nodejs#client-api-title-explanation"
        "get": "/docs/client-api/nodejs#client-api-method-retriving-data-instances"
        "Iterator": "/docs/client-api/nodejs#client-api-title-iterator"
        "keyspaces().retrieve": "/docs/client-api/nodejs#client-api-method-retrieving-all-keyspaces"
        "match": "/docs/client-api/nodejs#client-api-method-matching-patterns-in-data"
        "measurement": "/docs/client-api/nodejs#client-api-method-retrieving-the-numeric-value-of-a-centrality-computation"
        "owner": "/docs/client-api/nodejs#client-api-method-retrieving-the-concept-that-is-the-group-owner"
        "putAttributeType": "/docs/client-api/nodejs#client-api-method-creating-or-retrieving-an-attributetype"
        "putEntityType": "/docs/client-api/nodejs#client-api-method-creating-or-retrieving-an-entitytype"
        "putRelationshipType": "/docs/client-api/nodejs#client-api-method-creating-or-retrieving-a-relationshiptype"
        "putRole": "/docs/client-api/nodejs#client-api-method-creating-or-retrieving-a-role"
        "putRule": "/docs/client-api/nodejs#client-api-method-creating-or-retrieving-a-rule"
        "query": "/docs/client-api/nodejs#client-api-method-lazy-executation-of-a-graql-query"
        "session": "/docs/client-api/nodejs#client-api-method-creating-a-session"
        "transaction": "/docs/client-api/nodejs#client-api-title-session"
    })

    window.util_autoLinkKeywords(".language-python", {
        ## superset keywords that need to be linked first. example: undefine before define
        "get_attributes_by_value": "/docs/client-api/python#client-api-method-retriving-an-attribute-by-value"
        "get_concept": "/docs/client-api/python#client-api-method-retriving-a-concept-by-id"
        "get_schema_concept": "/docs/client-api/python#client-api-method-retriving-a-schema-concept-by-label"
        "keyspaces().delete": "/docs/client-api/python#client-api-method-deleting-a-keyspace"
        "query_pattern": "/docs/client-api/python#client-api-method-retrieving-a-graql-explanation-of-the-answer"
        "undefine": "/docs/client-api/python#client-api-method-manipulating-the-schema-programatically"
        ## retain alphabetic order
        "aggregate": "/docs/client-api/python#client-api-method-aggregating-values"
        "answers": "/docs/client-api/python#client-api-method-retrieving-deducted/factual-answers"
        "collect_concepts": "/docs/client-api/python#client-api-method-consuming-the-iterator-eagerly"
        "commit": "/docs/client-api/python#client-api-method-committing-a-write-transaction"
        "compute": "/docs/client-api/python#client-api-method-committing-a-write-transaction"
        "define": "/docs/client-api/python#client-api-method-computing-values"
        "delete": "/docs/client-api/python#client-api-method-deleting-data-instances"
        "explanation": "/docs/client-api/python#client-api-title-explanation"
        "get": "/docs/client-api/python#client-api-method-retriving-data-instances"
        "Iterator": "/docs/client-api/python#client-api-title-iterator"
        "keyspaces().retrieve": "/docs/client-api/python#client-api-method-retrieving-all-keyspaces"
        "match": "/docs/client-api/python#client-api-method-matching-patterns-in-data"
        "measurement": "/docs/client-api/python#client-api-method-retrieving-the-numeric-value-of-a-centrality-computation"
        "owner": "/docs/client-api/python#client-api-method-retrieving-the-concept-that-is-the-group-owner"
        "put_attribute_type": "/docs/client-api/python#client-api-method-creating-or-retrieving-an-attributetype"
        "put_entity_type": "/docs/client-api/python#client-api-method-creating-or-retrieving-an-entitytype"
        "put_relationship_type": "/docs/client-api/python#client-api-method-creating-or-retrieving-a-relationshiptype"
        "put_role": "/docs/client-api/python#client-api-method-creating-or-retrieving-a-role"
        "put_rule": "/docs/client-api/python#client-api-method-creating-or-retrieving-a-rule"
        "query": "/docs/client-api/python#client-api-method-lazy-executation-of-a-graql-query"
        "session": "/docs/client-api/python#client-api-method-creating-a-session"
        "transaction": "/docs/client-api/python#client-api-title-session"
    })

    # window.util_linkMarkdownStyle()

sidebar_scroll_top_position = 0;
sidebar_overflow = ""
handleBeforeTurbolinkVisit = ->
    window.sidebar_storeScrollPosition()

window.main_applySyntaxHighlighting = ->
    ## the line below is required to force initHighlighting
    ## to be recalled on each turobilink visit
    hljs.initHighlighting.called = false;
    hljs.initHighlighting()

$(document).on 'turbolinks:load', ready
$(document).on "turbolinks:before-visit", () -> handleBeforeTurbolinkVisit()