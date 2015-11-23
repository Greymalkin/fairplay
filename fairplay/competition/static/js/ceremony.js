(function() {

    $("select").change(function(event) {
        $(".report").hide();
        $("#" + $("select").val()).show();
    });

    $($("select")).change();

    $(".crossable").click(function(event) {
        $(event.target).parent().css("color", "#ddd");
        $(event.target).parent().css("text-decoration", "line-through");
    });

})();
