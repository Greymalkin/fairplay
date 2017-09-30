(function($) {

    function wrapMessage(message) {
        return function() {
            $.post('/ledsign/', message);
        }
    }

    function showLEDShow(ledShowID) {
        console.log('hey?');
        $.getJSON("/api/ledshows/" + ledShowID + "/")
        .success(function(data) {
            for (var i=0; i<data.messages.length; ++i) {
                var signData = {
                    "device": data.messages[i].led_sign.device,
                    "message": data.messages[i].message
                };

                setTimeout(wrapMessage(JSON.stringify(signData)), i * 100 + 100);
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

    $('a[href$="/export/meet/"]').click(function(e) {
        if (!confirm('Exporting the active meet will take several minutes. Are you sure?\
            \nIf so, click OK and be patient.\n\
            \nThe archive will download to your system automatically once the process is complete.')){
            e.preventDefault();
        }
    });

})(grp.jQuery)


