
$('#mysidebar').height($(".nav").height());


$( document ).ready(function() {

    //this script says, if the height of the viewport is greater than 800px, then insert affix class, which makes the nav bar float in a fixed
    // position as your scroll. if you have a lot of nav items, this height may not work for you.
    var h = $(window).height();
    //console.log (h);
    if (h > 800) {
        $( "#mysidebar" ).attr("class", "nav");
    }
    // activate tooltips. although this is a bootstrap js function, it must be activated this way in your theme.
    $('[data-toggle="tooltip"]').tooltip({
        placement : 'top'
    });

    /**
     * AnchorJS
     */
    anchors.add('h2,h3,h4,h5');

    $('[data-toggle="popover"]').popover({
        placement : 'top',
        trigger: 'hover',
        html: true
    });

});

$( document ).ready(function() {
    //Footer Subscribe logic
    var footerSubscribeButton = $("#footer-subscribe-btn");
    var footerSubscribeInput = $("#footer-subscribe-input");

    function validateEmail(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email.toLowerCase());
    }

    footerSubscribeButton.click(function() {
        var inputValue = footerSubscribeInput.val();
        if(validateEmail(inputValue)) {
            $.post(
                "https://grakn.ai/invite/mailchimp",
                {
                    email: inputValue
                }
            );
        }
    })

    // Code for pulling latest Download Version.
    $.ajax({
        url: "https://cms.grakn.ai/api/1.1/tables/version/rows?access_token=m7CBWmCjTog1OcNifMcM1TNlOYuztSyL",
      }).done(function(response) {
        var latest_version = response.data.length > 0? response.data.filter(item => item.latest === "True" && item.product==="core")[0].version : '';
       $('#download_nav_bar').html('Download ' + latest_version);
       $('#download_nav_bar_mobile').html('Download ' + latest_version);
       $('#download_footer').html('Grakn ' + latest_version);
    });
});
