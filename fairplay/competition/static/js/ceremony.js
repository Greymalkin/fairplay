(function() {

    $(".tab").click(function(event) {
        var $activeTab = $(event.target);
        $(".tab").parent().removeClass('active');
        $activeTab.parent().addClass('active');

        $(".report").hide();
        $("#" + $activeTab.attr('data-tab')).show();
    });

    $($(".tab")[0]).click();

    $(".crossable").click(function(event) {
        $(event.target).parent().css("color", "#ddd");
        $(event.target).parent().css("text-decoration", "line-through");
    });

})();
