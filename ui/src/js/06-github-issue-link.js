(function() {
  "use strict";
  var ISSUE_MAX_QUOTE_LENGTH = 1000;
  var ISSUE_REQUEST_URL = "https://github.com/vaticle/typedb-docs/issues/new";
  var ISSUE_TEMPLATE = "CHANGE_REQUEST.yml";
  var ISSUE_DEFAULT_TITLE = "New change request";
  var ISSUE_DEFAULT_DESCRIPTION = `

[describe your issue here]`;
  var selected_quote = "";

  var issueContainer = document.querySelector(".issue-link");

  if (issueContainer) {
    issueContainer.addEventListener("mousedown", getQuotedText);
    issueContainer.addEventListener("click", openIssue);
  }

  var brokenLinkReport = document.querySelector(".broken-link-report");

  if (brokenLinkReport) {
    brokenLinkReport.addEventListener("click", openBrokenLinkIssue);
  }

  function openIssue() {
    var article_url = window.location.href;
    var issue_preamble = selected_quote + ISSUE_DEFAULT_DESCRIPTION;

    var url = ISSUE_REQUEST_URL +
      "?template=" + ISSUE_TEMPLATE + 
      "&title=" + ISSUE_DEFAULT_TITLE +
      "&article=" + encodeURIComponent(article_url) + 
      "&issue-description=" + encodeURIComponent(issue_preamble);
    window.open(url, '_blank').focus();
  }

  function openBrokenLinkIssue() {
    var article_url = window.location.href;
    var issue_preamble = "Broken Link: ";

    var url = ISSUE_REQUEST_URL +
      "?template=" + ISSUE_TEMPLATE + 
      "&title=" + encodeURIComponent("Found Broken Link") +
      "&issue-description=" + encodeURIComponent(issue_preamble) + encodeURIComponent(article_url);
    window.open(url, '_blank').focus();
  }

  function getQuotedText() {
    var text = "";
    if (window.getSelection) {
        text = window.getSelection().toString();
    } else if (document.selection && document.selection.type != "Control") {
        text = document.selection.createRange().text;
    }
    if (text == "") text = "(no text to quote was selected)";
    console.log("selected text:" + text);
    selected_quote = text.substring(0,ISSUE_MAX_QUOTE_LENGTH).replace(/^/gm, '> ');
  }
})();