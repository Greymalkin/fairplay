(function() {
    var sessionTable = {};
    var events = [];
    var eventTable = {};
    var currentEvent = null;
    var currentSession = null;

    function onSelectEvent(event) {
        currentEvent  = eventTable[$(event.target).attr('data-id')];

        $("#event-name").text(currentEvent.name);

        $("#topnav li").removeClass("active");
        $(event.target).parent().addClass("active");

        $("label[for='sign-mode-select']").show();
        $("#sign-mode-select").show();
        $("#sign-mode-select").val('messaging');
        $("#sign-mode-select").change();
        $("#message-select").change();
    }

    function onChangeSession(event) {
        currentSession  = sessionTable[$(event.target).attr('data-id')];
        $("#sign-mode-select").val('messaging');
        $("#sign-mode-select").change();
        $("#message-select").change();
    }

    function onChangeMode(event) {
        var value = $(event.target).val();

        $("#messaging").hide();
        $("#introduce_teams").hide();
        $("#event_name").hide();
        $("#competition").hide();

        $("#" + value).show();

    }

    function onChangeMessage(event) {
        var data = {
            "device": currentEvent.sign.device,
            "message": $(event.target).val()
        };

        $.post('/ledsign/', JSON.stringify(data))
        .success(function(data) {
            console.log("Sent message!", data);
        })
        .error(function(data) {
            console.log("Error sending message!", data);
        });
    }

    function processSessions(data) {
        $("#session-select").empty();
        for (var i=0; i<data.length; ++i) {
            sessionTable[data[i].id] = data[i];
            $("#session-select").append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
        }

        currentSession = sessionTable[$("#session-select").attr('data-id')];
    }

    function processMessages(data) {
        $("#message-select").empty();
        for (var i=0; i<data.length; ++i) {
            $("#message-select").append('<option value="' + data[i].message + '">' + data[i].name + '</option>');
        }
    }

    function processEvents(data) {
        $("#topnav").empty();
        for (var i=0; i<data.length; ++i) {
            var eventNav = $('<a href="#" data-id="'+data[i].id+'">'+data[i].name+'</a>');
            eventNav.click(onSelectEvent);
            $("#topnav").append($("<li></li>").append(eventNav));

            events.push(data[i]);
            eventTable[data[i].id] = data[i];
        }
    }

    function processTeams(data) {

    }

    function handleError(e) {
        console.log("ERROR ", e);
    }

    $("#sign-mode-select").hide();

    $("#session-select").change(onChangeSession);
    $("#sign-mode-select").change(onChangeMode);
    $("#message-select").change(onChangeMessage);

    $.getJSON('/api/sessions')
    .success(processSessions)
    .error(handleError);

    $.getJSON('/api/messages')
    .success(processMessages)
    .error(handleError);

    $.getJSON('/api/events')
    .success(processEvents)
    .error(handleError);

    $.getJSON('/api/teams')
    .success(processTeams)
    .error(handleError);


})();
