(function() {
    var eventList = [];
    var eventTable = {};
    var currentEvent = null;
    var currentSession = null;
    var currentAthletes = null;
    var introText = "";

    // using jQuery
    function getCookie(name) {
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
    var csrftoken = getCookie('csrftoken');

    $.ajaxSetup({
        beforeSend: function(xhr, settings) {
            xhr.setRequestHeader("X-CSRFToken", csrftoken);
        }
    });

    function onSelectEvent(event) {
        currentEvent  = eventTable[$(event.target).attr('data-id')];

        $("#event-name").text(currentEvent.name);
        $("#competition").show();

        $("#topnav li").removeClass("active");
        $(event.target).parent().addClass("active");

        $("label[for='sign-mode-select']").show();
        $("#sign-mode-select").show();
        $("#sign-mode-select").val('messaging');
        $("#sign-mode-select").change();
        $("#message-select").val($("#message-select option:first").val());
        $("#message-select").change();
    }

    function onChangeAthleteID(event) {
        if (event.keyCode == 13) {
            loadAthlete();
        }
    }

    function onScoreKey(event) {
        if (event.which == 13) {
            var row = $(event.target).parent().parent().find("td");
            saveAthlete(event);
        }
    }

    function processAthlete(data) {
        var score = null;

        data.events.forEach(function(item) {
            if (item.event == currentEvent.id) {
                score = item.score;
            }
        });

        $("#scoreboard").show();
        $("#athlete-id-confirm").text(data.athlete_id);
        $("#athlete-last-name-confirm").text(data.last_name);
        $("#athlete-first-name-confirm").text(data.first_name);
        $("#athlete-team-confirm").text(data.team.team);

        $("#athlete-score-entry").val(score);

        if (String(score).length > 0) {
            $("#athlete-score-entry").addClass("alert-success");
        } else {
            $("#athlete-score-entry").removeClass("alert-success");
        }

        $("#athlete-score-entry").focus();
        $("#athlete-score-entry").select();
    }

    function loadAthlete() {
        var athleteId = $("#athlete-id-entry").val();
        $("#athlete-id-entry").val('');
        $.getJSON('/api/athletes/' + athleteId + '/')
        .success(processAthlete)
        .error(function() {
            alert("Sorry, no athlete with ID " + athleteId + " exists!")
        });
    }

    function saveAthlete(event) {
        var tr = $(event.target).parent().parent();
        var row = tr.find("td");

        var score = parseFloat($(row[4]).children()[0].value);

        if (score >= 0 && score <= 20) {
            var id = tr.attr('data-id');
            $.ajax({
                url: '/api/athleteevents/' + id,
                data: JSON.stringify({"id":id, "score": score, "event":currentEvent.id}),
                type: 'PUT',
                contentType: 'Application/JSON'
            })
            .success(function(data) {
                tr.fadeTo(100, 0.2, function() { tr.fadeTo(100, 1); });
                var input = $($(row[4]).children()[0]);
                input.addClass("alert-success");

                // put the score back into the data
                var athlete = currentAthletes[parseInt(input.attr('data-index'))];
                for (var j=0; j<athlete.athlete.events.length; ++j) {
                    if (athlete.athlete.events[j].event == currentEvent.id) {
                        athlete.athlete.events[j].score = score;
                    }
                }
            })
            .error(function(data) {
                console.log("FAILURE");
            });
        } else {
            alert("Invalid score");
            $(row[5]).children()[0].value = "";
        }

        var id = $(row[0]).text();
        var lastName = $(row[1]).text();
        var firstName = $(row[2]).text();
        var team = $(row[3]).text();
        var scoreText = $(row[4]).children()[0].value;

        if (!isNaN(score) && score > 0) {

            var message = "|MODE_ROLL_UP||WIDE_ON||COLOR_GREEN|"+scoreText + "|WIDE_OFF|";
            message += "|MODE_ROTATE||COLOR_RED|";
            message += id + " " + firstName + " " + lastName + " - " + team + "     ";

            message += "|WIDE_ON||COLOR_GREEN|"+scoreText + "|WIDE_OFF|";

            var data = {
                "device": currentEvent.sign.device,
                "message": message
            };

            $.post('/ledsign/', JSON.stringify(data))
            .success(function(data) {
                console.log("Sent message!", data);
            })
            .error(function(data) {
                console.log("Error sending message!", data);
            });
        }
    }

    function processEvents(data) {
        $("#topnav").empty();

        for (var i=0; i<data.length; ++i) {
            var eventNav = $('<a href="#" data-id="'+data[i].id+'" tabindex="-1">'+data[i].name+'</a>');
            eventNav.click(onSelectEvent);
            $("#topnav").append($("<li></li>").append(eventNav));

            eventList.push(data[i]);
            eventTable[data[i].id] = data[i];
        }
    }

    // get a wrapped list of event IDs
    function getEventList(id) {
        var result = [];
        result.push(id);

        for (var i=0; i<eventList.length; ++i) {
            if (eventList[i].id === id) {
                break;
            }
        }

        while (result.length < eventList.length) {
            ++i;
            if (i == eventList.length) {
                i = 0;
            }
            result.push(eventList[i].id);
        }

        return result;
    }

    function handleError(e) {
        console.log("ERROR ", e);
    }

    $("#athlete-id-entry").on("keypress", onChangeAthleteID)
    $("#athlete-find-button").click(loadAthlete);

    $.getJSON('/api/events')
    .success(processEvents)
    .error(handleError);


})();
