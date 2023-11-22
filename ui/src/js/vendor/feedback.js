(function() {
    const feedbackButton = document.getElementById("feedback-btn");
    const cdkOverlayBackdrop = document.querySelector(".cdk-overlay-backdrop");
    const closeButton = document.querySelector("td-dialog-close-button button");
    let formServed = false;
    feedbackButton.addEventListener("click", () => {
        toggleDialogVisibility();
        if (!formServed) {
            formServed = true;
            window.hbspt.forms.create({
                region: "na1",
                portalId: "4332244",
                formId: "b5b6e7c0-ba28-4623-9164-ab508589443b",
                formInstanceId: "popup-hubspot-form-holder",
                target: `#$popup-hubspot-form-holder`,
                onFormError: () => { onLoadingChange(false); },
                onFormSubmit: () => { onLoadingChange(true); },
                onFormSubmitted: (formEl, { submissionValues }) => {
                    onLoadingChange(false);
                    onSuccess(formEl, submissionValues);
                },
            });
        }
    });
    cdkOverlayBackdrop.addEventListener("click", () => { toggleDialogVisibility(); });
    closeButton.addEventListener("click", () => { toggleDialogVisibility(); });
})();

function toggleDialogVisibility() {
    const cdkOverlayBackdrop = document.querySelector(".cdk-overlay-backdrop");
    const cdkOverlayContainer = document.querySelector(".cdk-overlay-container");
    cdkOverlayBackdrop.classList.toggle("cdk-overlay-backdrop-showing");
    cdkOverlayContainer.classList.toggle("cdk-visually-hidden");
}

function onLoadingChange() {

}

function onSuccess() {
    alert("Your feedback has been submitted - thank you!");
}
