(function() {
    var sessionTable = {};
    var eventList = [];
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

        if (value == "competition") {
            $("#rotation-select").change();
        }

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

    function onChangeRotation(event) {
        var rotation = $(event.target).val();
        $("#scoreboard").find("tr:gt(0)").remove();

        var athletes = currentSession.events[currentEvent.id][rotation];

        for (var i=0; i<athletes.length; ++i) {
            var athlete = athletes[i];
            var score = "";

            for (var j=0; j<athlete.events.length; ++j) {
                if (athlete.events[j].event == currentEvent.id) {
                    score = athlete.events[j].score;
                }
            }

            var row = $("<tr></tr>");
            row.append('<td>' + athlete.athlete.athlete_id+ '</td>');
            row.append('<td>' + athlete.athlete.last_name+'</td>');
            row.append('<td>' + athlete.athlete.first_name+'</td>');
            row.append('<td>' + athlete.athlete.team+'</td>');
            row.append('<td><button type="button" class="btn btn-warning next-button">Up Next</button></td>');
            if (score === "") {
                row.append('<td><input class="form-control bg-warning" size="4"></input></td>');
            } else {
                row.append('<td><input class="form-control bg-success" size="4"></input></td>');
            }
            row.append('<td><button data-id="' + athlete.athleteEventID + '"type="button" class="btn btn-primary save-button">Save</button></td>');
            row.append('<td><button type="button" class="btn btn-success show-button">Show</button></td>');
            $("#scoreboard").append(row);
        }

        $(".next-button").click(showNextAthlete);
        $(".save-button").click(saveAthlete);
        $(".show-button").click(showAthleteScore);
    }

    function showNextAthlete(event) {
        var row = $(event.target).parent().parent().find("td");

        var id = $(row[0]).text();
        var lastName = $(row[1]).text();
        var firstName = $(row[2]).text();
        var team = $(row[3]).text();

        var message = "|MODE_ROLL_UP||COLOR_GREEN|Next Up:|MODE_ROTATE||COLOR_YELLOW|";
        message += id + " " + firstName + " " + lastName + " - " + team;

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

    function saveAthlete(event) {
        var row = $(event.target).parent().parent().find("td");

    }

    function showAthleteScore(event) {
        var row = $(event.target).parent().parent().find("td");

        var id = $(row[0]).text();
        var lastName = $(row[1]).text();
        var firstName = $(row[2]).text();
        var team = $(row[3]).text();
        var diff_score = $(row[5]).text();
        var exec_score = $(row[6]).text();
        var score = 0;

        if (diff_score.length > 0) {
            score += parseFloat(diff_score);
        }

        if (exec_score.length > 0) {
            score += parseFloat(exec_score);
        }

        if (score > 0) {

            var message = "|MODE_ROTATE||COLOR_RED|";
            message += id + " " + firstName + " " + lastName + " - " + team + " : ";

            message += "|WIDE_ON||COLOR_GREEN|"+score + "|WIDE_OFF|";

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

    function processSessions(data) {
        $("#session-select").empty();

        for (var i=0; i<data.length; ++i) {
            data[i].events = {};

            for (var j=0; j<eventList.length; ++j) {
                data[i].events[eventList[j].id] = [];

                for (var k=0; k<eventList.length; ++k) {
                    data[i].events[eventList[j].id].push([]);
                }
            }

            sessionTable[data[i].id] = data[i];
            $("#session-select").append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
        }

        currentSession = sessionTable[$("#session-select").attr('data-id')];

        $.getJSON('/api/teams')
        .success(processTeams)
        .error(handleError);
    }

    function processMessages(data) {
        $("#message-select").empty();
        $("#message-select").append('<option value="">--</option>');

        for (var i=0; i<data.length; ++i) {
            $("#message-select").append('<option value="' + data[i].message + '">' + data[i].name + '</option>');
        }
    }

    function processEvents(data) {
        $("#topnav").empty();
        $("#rotation-select").empty();

        for (var i=0; i<data.length; ++i) {
            var eventNav = $('<a href="#" data-id="'+data[i].id+'">'+data[i].name+'</a>');
            eventNav.click(onSelectEvent);
            $("#topnav").append($("<li></li>").append(eventNav));

            eventList.push(data[i]);
            eventTable[data[i].id] = data[i];
            $("#rotation-select").append('<option value="' + i + '">Rotation #' + (i + 1) + '</option>');
        }

        $.getJSON('/api/sessions')
        .success(processSessions)
        .error(handleError);
    }

    function findSession(id) {
        for (var p in sessionTable) {
            for (var q=0; q<sessionTable[p].groups.length; ++q) {
                if (sessionTable[p].groups[q].id === id) {
                    return sessionTable[p];
                }
            }
        }

        return null;
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


    function processTeams(data) {
        for (var i=0; i<data.length; ++i) {
            var team = data[i];

            for (var j=0; j<team.athletes.length; ++j) {
                athlete = team.athletes[j];
                athlete.team = team.name;
                session = findSession(athlete.group.id);
                if (session !== null) {
                    var eventIDs = getEventList(athlete.starting_event);

                    for (var k=0; k<eventIDs.length; ++k) {
                        var eventID = eventIDs[k];
                        var athleteEventID = null;

                        for (var q=0; q<athlete.events.length; ++q) {
                            if (athlete.events[q].event === eventID) {
                                athleteEventID = athlete.events[q].id;
                            }
                        }

                        session.events[eventID][k].push({
                            "athlete":athlete,
                            "athleteEventID": athleteEventID
                        });
                    }
                }
            }
        }
    }

    function handleError(e) {
        console.log("ERROR ", e);
    }

    $("#sign-mode-select").hide();

    $("#rotation-select").change(onChangeRotation);
    $("#session-select").change(onChangeSession);
    $("#sign-mode-select").change(onChangeMode);
    $("#message-select").change(onChangeMessage);

    $.getJSON('/api/messages')
    .success(processMessages)
    .error(handleError);

    $.getJSON('/api/events')
    .success(processEvents)
    .error(handleError);


})();
