(function() {
    var UPDATE_RATE = 20000;

    var dataPath = null;
    var lastData = null;
    var updateTable = {};

    var scoreTemplate = _.template(
'<table class="u-full-width scoretable">\
  <thead>\
    <tr class="info">\
      <th colspan="5" class="gymnast"><%- first_name %> <%- last_name %></th>\
      <th colspan="2" class="division"><%- division %></th>\
    </tr>\
    <tr class="events">\
      <th>FX</th>\
      <th>PH</th>\
      <th>VT</th>\
      <th>SR</th>\
      <th>PB</th>\
      <th>HB</th>\
      <th>AA</th>\
    </tr>\
  </thead>\
  <tbody>\
    <tr class="scores">\
      <td id="<%- id %>_FX_score">-</td>\
      <td id="<%- id %>_PH_score">-</td>\
      <td id="<%- id %>_VT_score">-</td>\
      <td id="<%- id %>_SR_score">-</td>\
      <td id="<%- id %>_PB_score">-</td>\
      <td id="<%- id %>_HB_score">-</td>\
      <td id="<%- id %>_AA_score">-</td>\
    </tr>\
    <tr class="rankings">\
      <td id="<%- id %>_FX_rank">-</td>\
      <td id="<%- id %>_PH_rank">-</td>\
      <td id="<%- id %>_VT_rank">-</td>\
      <td id="<%- id %>_SR_rank">-</td>\
      <td id="<%- id %>_PB_rank">-</td>\
      <td id="<%- id %>_HB_rank">-</td>\
      <td id="<%- id %>_AA_rank">-</td>\
    </tr>\
  </tbody>\
</table>');

    function init() {
        $.getJSON("data/meet.json")
        .done(function(data) {
            var sessionList = $("#sessionList");
            _.forEach(data.sessions, function(session) {
                var button = $('<button class="u-full-width">'+session[1]+'</button>');
                button.click(function() {
                    loadSession("data/" + session[2]);
                });
                sessionList.append(button);
            });
        });
    }

    function updateScores() {
        var scoreCount = 0;
        var rankCount = 0;
        _.forEach(lastData.teams, function(team) {
            _.forEach(team.levels, function(level) {
                _.forEach(level.athletes, function(athlete) {
                    _.forEach(athlete.scores, function(score) {
                        var scoreID = "#" + athlete.id + "_" + score[0] + "_score";
                        var rankID = "#" + athlete.id + "_" + score[0] + "_rank";

                        if (updateTable[scoreID] != score[1] && score[1] != null) {
                            $(scoreID).text(score[1]);
                            updateTable[scoreID] = score[1];
                            ++scoreCount;
                        }

                        if (updateTable[rankID] != score[2] && score[2] != null && score[1] != null) {
                            $(rankID).text("#" + score[2]);
                            updateTable[rankID] = score[2];
                            ++rankCount;
                        }
                    });
                })
            })
        })
        console.log("Updated " + scoreCount + " scores and " + rankCount + " rankings");
    }

    function loadSession(dataPath) {
        $("#homeContainer").hide();

        var scores = $("#scoresContainer");
        scores.show();

        $.getJSON(dataPath + "?" + (new Date().getTime()))
        .done(function(data) {
            _.forEach(data.teams, function(team) {
                scores.append("<h1>" + team.name + "</h1>").fadeIn();

                _.forEach(team.levels, function(level) {
                    scores.append("<h2>Level " + level.name + "</h2>").fadeIn();

                    _.forEach(level.athletes, function(athlete) {
                        scores.append(scoreTemplate(athlete)).fadeIn();
                    })
                })
            })
            lastData = data;
            updateScores();
            setInterval(function() {
                $.getJSON(dataPath + "?" + (new Date().getTime()))
                .done(function(data) {
                    lastData = data;
                    updateScores();
                });
            }, UPDATE_RATE);
            scores.fadeIn();
        })
        .fail(function() {
            alert("That session data is not available at this time.");
            $("#homeContainer").fadeIn();
        });
    }

    init();
})();
