(function() {
    var eventList = [];
    var eventTable = {};
    var currentEvent = null;
    var currentSession = null;
    var currentAthlete = null;
    var currentAthleteEventId = null;
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
        currentEvent  = eventTable[$("#event-select").val()];

        $("#event-name").text(currentEvent.name);
        $("#competition").show();
        $("#history").show();

        $("#scoreboard").hide();
        $("#history-list").empty();

        $("#topnav li").removeClass("active");

        $("label[for='sign-mode-select']").show();
        $("#sign-mode-select").show();
        $("#sign-mode-select").val('messaging');
        $("#sign-mode-select").change();
        $("#message-select").val($("#message-select option:first").val());
        $("#message-select").change();

        $("#athlete-id-entry").focus();
    }

    function onChangeAthleteID(event) {
        if (event.keyCode == 13) {
            loadAthlete();
        }
    }

    function onScoreKey(event) {
        if (event.keyCode == 13) {
            saveAthlete(event);
        }
    }

    function processAthlete(data) {
        var score = null;

        data.events.forEach(function(item) {
            if (item.event == currentEvent.id) {
                score = item.score;
                currentAthleteEventId = item.id;
            }
        });

        currentAthlete = data;
        $("#scoreboard").show();
        $("#athlete-id-confirm").text(data.athlete_id);
        $("#athlete-last-name-confirm").text(data.last_name);
        $("#athlete-first-name-confirm").text(data.first_name);
        $("#athlete-team-confirm").text(data.team.team);

        $("#athlete-score-entry").val(score);

        if (score == null || String(score).length == 0) {
            $("#athlete-score-entry").removeClass("alert-warning");
        } else {
            $("#athlete-score-entry").addClass("alert-warning");
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
        var score = parseFloat($("#athlete-score-entry").val());

        if (score >= 0 && score <= 20) {
            $("#scoreboard").fadeOut();
            $.ajax({
                url: '/api/athleteevents/' + currentAthleteEventId + '/',
                data: JSON.stringify({
                    "id":currentAthleteEventId,
                    "score": score,
                    "event":currentEvent.id
                }),
                type: 'PUT',
                contentType: 'Application/JSON'
            })
            .success(function(data) {
                showScore(score);
                currentAthlete = null;
                currentAthleteEventId = null;
            })
            .error(function(data) {
                alert("Problem saving athlete event score!");
                currentAthlete = null;
                currentAthleteEventId = null;
            });

            $("#athlete-id-entry").focus();

        } else {
            alert("Invalid score");
            $("#athlete-score-entry").val("")
        }
    }

    function showScore(score) {
        var id = currentAthlete.athlete_id;
        var lastName = currentAthlete.last_name;
        var firstName = currentAthlete.first_name;
        var team = currentAthlete.team.team;
        var scoreText = String(score);

        if (scoreText.split(".").length == 1) {
            scoreText += ".0";
        }

        $("#history-list").prepend("<tr><td>" + id + " " + lastName +", " + firstName + "</td><td>" + scoreText + "</td></tr>");

        if (!isNaN(score) && score > 0) {

            var message = "|MODE_ROLL_UP||WIDE_ON||COLOR_GREEN|"+scoreText + "|WIDE_OFF|";
            message += "|MODE_ROTATE||COLOR_RED|";
            message += id + " " + firstName + " " + lastName + " - " + team + "     ";

            message += "|WIDE_ON||COLOR_GREEN|"+scoreText + "|WIDE_OFF|";

            var data = {
                "device": currentEvent.sign.device,
                "message": message
            };

            console.log(data);

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
        $("#event-select").empty();

        for (var i=0; i<data.length; ++i) {
            $("#event-select").append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            eventList.push(data[i]);
            eventTable[data[i].id] = data[i];
        }

        onSelectEvent();
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

    $("#athlete-id-entry").on("keypress", onChangeAthleteID);
    $("#athlete-score-entry").on("keypress", onScoreKey);
    $("#athlete-find-button").click(loadAthlete);
    $("#athlete-save-button").click(saveAthlete);
    $("#event-select").change(onSelectEvent)

    $.getJSON('/api/events')
    .success(processEvents)
    .error(handleError);


})();
