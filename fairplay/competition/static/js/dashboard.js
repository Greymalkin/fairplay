(function($) {

    function showLEDShow(ledShowID) {
        $.getJSON("/api/ledshows/" + ledShowID + "/")
        .success(function(data) {
            for (var i=0; i<data.messages.length; ++i) {
                var signData = {
                    "device": data.messages[i].led_sign.device,
                    "message": data.messages[i].message
                };

                $.post('/ledsign/', JSON.stringify(signData));
            }
        });
    }

    $('a[href="#upload"]').upload({
        action: "/",
    });

    $("#led-show-button").click(function() {
        var ledShowID = $("#led-show-select").val();

        if (ledShowID != "") {
            showLEDShow(ledShowID);
        }

        $("#led-show-select").val("");
    });

})(grp.jQuery)


