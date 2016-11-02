// $(function() {
//   console.log(window.location.pathname);

//   console.log(PageData);

//   if (window.location.pathname == "/users/" + user_id + "/leagues/" + league_id + "/teams") {

//     var leagueJBRs = []
//     var leagueTeams = [];

//     var JbrLeagueRankData = getLeagueChartData();
//     console.log(JbrLeagueRankData);

//     for (var i = 0; i < JbrLeagueRankData.length; i++) {
//           var obj = JbrLeagueRankData[i];
//           var team_name = obj[Object.keys(obj)[0]];
//           var team_jbr = obj[Object.keys(obj)[1]];
//           leagueTeams.push(team_name);
//           leagueJBRs.push(team_jbr);
//       }

//     $('#rank_column-top').highcharts({
//           chart: {
//               type: 'column',
//               options3d: {
//                   enabled: true,
//                   alpha: 15,
//                   beta: 15,
//                   depth: 50,
//                   viewDistance: 25
//               }
//           },
//           title: {
//               text: 'Category Leaderboard'
//           },
//           subtitle: {
//               text: 'Category: Total Overall'
//           },
//           plotOptions: {
//               column: {
//                   depth: 25
//               }
//           },
//           xAxis: {
//               categories: leagueTeams
//           },
//           series: [{
//             data: leagueJBRs
//           }]
//       });
//   }
// });









