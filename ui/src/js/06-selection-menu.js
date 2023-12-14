(function() {
    "use strict";

    const selectionMenu = document.querySelector(".selection-menu");
    const selectionCopyButton = document.querySelector(".selection-copy-button");
    const selectionReportLink = document.querySelector(".selection-report-link");
    const reportUrl = document.querySelector("#report-link");

    let timeoutRef;

    document.addEventListener("selectionchange", () => {
        const selection = window.getSelection();
        const isDoc = selection.anchorNode?.parentNode?.closest(".doc");
        const text = selection.toString();

        clearTimeout(timeoutRef);

        if (!isDoc || !text) {
            selectionMenu.classList.remove("is-active");
            return;
        }

        timeoutRef = setTimeout(() => {
            selectionMenu.classList.add("is-active");
            const selectionRect = selection.getRangeAt(0).getBoundingClientRect();
            selectionMenu.style.top = selectionRect.top + window.scrollY + "px";
            selectionMenu.style.left = selectionRect.left + selectionRect.width / 2 + "px";
            const url = new URL(reportUrl);
            const bodyTextArr = url.searchParams.get("body").split("\n");
            const appendedText = "\n#### Text:\n>" + text.replaceAll(">", "\\>").replaceAll("\n", "\n>");
            url.searchParams.set(
                "body",
                bodyTextArr
                    .slice(0, 2)
                    .concat(appendedText)
                    .concat(bodyTextArr.slice(2))
                    .join("\n")
            );
            selectionReportLink.href = url.toString();
            selectionCopyButton.classList.remove("clicked");
            selectionCopyButton.onclick = () => {
                window.navigator.clipboard.writeText(text).then(() => selectionCopyButton.classList.add("clicked"));
            };
        }, 100);
    });
})();
