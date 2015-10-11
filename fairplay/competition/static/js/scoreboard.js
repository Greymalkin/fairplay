(function() {
    var sessionTable = {};
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

        $("#topnav li").removeClass("active");
        $(event.target).parent().addClass("active");

        $("label[for='sign-mode-select']").show();
        $("#sign-mode-select").show();
        $("#sign-mode-select").val('messaging');
        $("#sign-mode-select").change();
        $("#message-select").val($("#message-select option:first").val());
        $("#message-select").change();
    }

    function onChangeSession(event) {
        currentSession  = sessionTable[parseInt($("#session-select").val())];

        if (currentEvent !== null) {
            $("#sign-mode-select").val('messaging');
            $("#sign-mode-select").change();
            $("#message-select").val($("#message-select option:first").val());
            $("#message-select").change();
        }

        for (var p in currentSession.teams) {
            var athleteList = currentSession.teams[p];
            introText += "|MODE_WIPE_DOWN||COLOR_RED|"+p+"|MODE_ROTATE|";
            for (var i=0; i<athleteList.length; ++i) {
                var athlete = athleteList[i];
                if (i % 2 === 0){
                    introText += "|COLOR_YELLOW|";
                } else {
                    introText += "|COLOR_GREEN|";
                }
                introText += athlete.athlete_id + " " + athlete.first_name + " " + athlete.last_name + "  ";
            }
        }
    }

    function onChangeMode(event) {
        var value = $(event.target).val();

        $("#messaging").hide();
        $("#introduce_teams").hide();
        $("#competition").hide();

        $("#" + value).show();

        if (value == "competition") {
            $("#rotation-select").val("0");
            $("#rotation-select").change();

        } else if (value == "introduce_teams") {
            var data = {
                "device": currentEvent.sign.device,
                "message": introText
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

        currentAthletes = athletes;

        for (var i=0; i<athletes.length; ++i) {
            var athlete = athletes[i];
            var score = null;

            for (var j=0; j<athlete.athlete.events.length; ++j) {
                if (athlete.athlete.events[j].event == currentEvent.id) {
                    score = athlete.athlete.events[j].score;
                }
            }

            var row = $('<tr data-id="' + athlete.athleteEventID + '"></tr>');
            row.append('<td>' + athlete.athlete.athlete_id+ '</td>');
            row.append('<td>' + athlete.athlete.last_name+'</td>');
            row.append('<td>' + athlete.athlete.first_name+'</td>');
            row.append('<td>' + athlete.athlete.team+'</td>');
            if (score === null) {
                scoreInput = $('<input class="form-control"  size="4" data-index="'+i+'"></input>');
            } else {
                scoreInput = $('<input class="form-control alert-success" size="4" value="'+score+'" data-index="'+i+'"></input>');
            }
            scoreInput.keypress(onScoreKey);
            scoreCol = $("<td></td>");
            scoreCol.append(scoreInput);
            row.append(scoreCol);
            row.append('<td><button "type="button" class="btn btn-primary save-button">Save</button></td>');
            $("#scoreboard").append(row);
        }

        $(".next-button").click(showNextAthlete);
        $(".save-button").click(saveAthlete);
    }

    function onScoreKey(event) {
        if (event.which == 13) {
            var row = $(event.target).parent().parent().find("td");
            saveAthlete(event);
        }
    }

    function showNextAthlete(event) {
        var row = $(event.target).parent().parent().find("td");

        var id = $(row[0]).text();
        var lastName = $(row[1]).text();
        var firstName = $(row[2]).text();
        var team = $(row[3]).text();

        var message = "|MODE_WIPE_UP||COLOR_GREEN|Next Up:|MODE_ROTATE||COLOR_YELLOW|";
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

    function processSessions(data) {
        $("#session-select").empty();

        for (var i=0; i<data.length; ++i) {
            var session = data[i];
            session.events = {};
            session.teams = {};

            for (var j=0; j<eventList.length; ++j) {
                session.events[eventList[j].id] = [];

                for (var k=0; k<eventList.length; ++k) {
                    session.events[eventList[j].id].push([]);
                }
            }

            sessionTable[session.id] = data[i];
            $("#session-select").append('<option value="' + session.id + '">' + session.name + '</option>');
        }

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
            session = sessionTable[p];
            for (var q=0; q<session.groups.length; ++q) {
                if (session.groups[q].id === id) {
                    return session;
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
        var warnings = [];

        for (var i=0; i<data.length; ++i) {
            var team = data[i];

            for (var j=0; j<team.athletes.length; ++j) {
                athlete = team.athletes[j];
                athlete.team = team.name;
                session = findSession(athlete.group.id);

                if (session !== null) {
                    if (session.teams[team.name] == null) {
                        session.teams[team.name] = [];
                    }
                    session.teams[team.name].push(athlete);



                    if (athlete.starting_event === null) {
                        warnings.push(athlete.first_name + " " + athlete.last_name + " ("+athlete.team+")");

                    } else {
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

        if (warnings.length > 0) {
            warningText = "WARNING! The following athletes to not have a starting event specificied:\n";
            warningText += warnings.join(", ");
            alert(warningText);
        }

        onChangeSession(null);
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
