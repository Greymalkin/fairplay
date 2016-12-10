(function() {

    $("select").change(function(event) {
        $(".report").hide();
        $("#" + $("select").val()).show();
    });

    $($("select")).change();

    $(".crossable").click(function(event) {
    	console.log();
    	if ($(event.target).parent().hasClass('crossed-off')) {
	        $(event.target).parent().removeClass('crossed-off');
    	} else {
	        $(event.target).parent().addClass('crossed-off');
    	}
    });

})();
