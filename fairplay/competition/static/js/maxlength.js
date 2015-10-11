(function($) {

    function updateRemainingCount(event) {
        var input = $(event.target);
        var span = input.next("span");
        var count = parseInt(input.attr('maxlength')) - input.val().length;
        span.text(count);
        if (count < 10) {
            span.css("color", "#CC0000");
        } else {
            span.css("color", "#000000")
        }
    }

    $(document).ready(function() {
        var inputs = $('input[maxlength]');

        for (var i=0; i<inputs.length; ++i) {
            var input = $(inputs[i]);
            console.log(parseInt(input.attr('maxlength')), input.val(), input.val().length);
            var count = parseInt(input.attr('maxlength')) - input.val().length;
            var info = '<span style="margin-left:4px;font-weight:bold;">' + count + '</span>';
            input.after(info);
        }

        inputs.on("input propertychange", updateRemainingCount);
    });
})(grp.jQuery);
