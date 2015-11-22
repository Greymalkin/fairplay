(function($) {

    function clearLEDSigns() {

    }

    $('a[href="#upload"]').upload({
        action: "/",
    });

    $("#led-show-button").click(function() {
        var ledShowID = $("#led-show-select").val();

        clearLEDSigns();
        if (ledShowID != "") {
            showLEDShow(ledShowID);
        }

        $("#led-show-select").val("");
    });

})(grp.jQuery)


