$(function() {
  if (window.location.pathname == "/users/" + PageData.user_id + "/leagues/" + PageData.league_id) {
    var leagueJBRs = [];
    var leagueTeams = [];

    var JbrLeagueRankData = getLeagueChartData();

    for (var i = 0; i < JbrLeagueRankData.length; i++) {
          var obj = JbrLeagueRankData[i];
          var team_name = obj[Object.keys(obj)[0]];
          var team_jbr = obj[Object.keys(obj)[1]];
          var decoded = he.decode(team_name);
          leagueTeams.push(decoded);
          leagueJBRs.push(team_jbr);
      }

    $('#rank_column-top').highcharts({
          chart: {
              type: 'column',
              options3d: {
                  enabled: true,
                  alpha: 15,
                  beta: 15,
                  depth: 50,
                  viewDistance: 25
              }
          },
          title: {
              text: 'Category Leaderboard'
          },
          subtitle: {
              text: 'Category: Total Overall'
          },
          plotOptions: {
              column: {
                  depth: 25
              }
          },
          xAxis: {
              categories: leagueTeams
          },
          yAxis: {
            floor: 200,
            ceiling: 500

          },
          series: [{
            data: leagueJBRs
          }]
      });
  }

});
