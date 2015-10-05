(function($){
	function updateCompetitionAge(dob){
		console.log(dob);
	}

    $(document).ready(function() {
        var inputs = $('[id^=id_gymnasts-][id$=-dob]');

        console.log(inputs.length);
        console.log(inputs);

    });

})(grp.jQuery);