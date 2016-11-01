// // function drawLineChart_top (chartData) {
// $(function () {
//   var selectedPlayers = [];




//   $('#playersTable').on('check.bs.table', function (e, row) {
//     selectedPlayers.push({
//       id: row.id,
//       name: row.name,
//       pro_team: row.pro_team,
//       positions: row.positions,
//       yahoo_rank: row.yahoo_rank,
//       jbr: row.jbr,
//       g: row.g,
//       a: row.a,
//       p: row.p,
//       ppg: row.ppg,
//       ppa: row.ppa,
//       ppp: row.ppp,
//       plusminus: row.plusminus,
//       shg: row.shg,
//       sha: row.sha,
//       shp: row.shp,
//       gwg: row.gwg,
//       gtg: row.gtg,
//       pim: row.pim,
//       sog: row.sog,
//       shpercent: row.shpercent,
//       fw: row.fw,
//       fl: row.fl,
//       hit: row.hit,
//       blk: row.blk
//     });
//     console.log(selectedPlayers);
//     alert(selectedPlayers.length);
//   });
// });


// $(function () {
//   $('#line_graph-top').highcharts({
//     title: {
//       text: 'Player Stats',
//       x: -20 //center
//     },
//     subtitle: {
//       text: 'Source: Yahoo Fantasy Sports',
//       x: -20
//     },
//     xAxis: {
//       categories: [
//       'Y!',
//       'JBR',
//       'G',
//       'A',
//       'P',
//       'PPG',
//       'PPA',
//       'PPP',
//       '+/-',
//       'SHG',
//       'SHA',
//       'SHP',
//       'GWG',
//       'GTG',
//       'SOG',
//       'SH%',
//       'FW',
//       'FL',
//       'HIT',
//       'BLK',
//       'TOTAL'
//       ]
//     },
//     yAxis: {
//       title: {
//           text: 'Season Total'
//       },
//       plotLines: [{
//           value: 0,
//           width: 1,
//           color: '#808080'
//       }]
//     },
//     legend: {
//       layout: 'vertical',
//       align: 'right',
//       verticalAlign: 'middle',
//       borderWidth: 0
//     },
//     series: [{
//       name: 'P.Kane',
//       data: [82, 46, 60, 106, 17, 30, 37, 21, 11, 40, .216, 17, 20, 0, 0, 9, 287, .160]
//     }, {
//       name: 'S.Crosby',
//       data: [80, 36, 49, 85, 19, 42, 90, 35, 986, 921, .517, 10, 14, 0, 0, 9, 248, .145]
//     }, {
//       name: 'A.Ovenchkin',
//       data: [79, 50, 21, 71, 21, 53, 225, 34, 0, 0, .000, 19, 5, 0, 0, 8, 398, .126]
//     }, {
//       name: 'D. Sedin',
//       data: [82, 28, 33, 61, 7, 36, 20, 19, 5, 14, .263, 8, 11, 0, 1, 6, 258, .109]
//     }]
//   });
// });


// // function drawLineChart_top (chartData) {
// $(function () {
//   $('#line_graph-top').highcharts({
//     title: {
//       text: '2016 Best Players',
//       x: -20 //center
//     },
//     subtitle: {
//       text: 'Source: Yahoo Fantasy Sports',
//       x: -20
//     },
//     xAxis: {
//       categories: ['G', 'A', 'P', '+/-', 'PPG', 'PPA',
//           'PPP', 'SHG', 'SHA', 'SHP', 'GWG', 'GTG','SOG', 'SH%', 'FW', 'FL', 'HIT', 'BLK', 'TOTAL']
//     },
//     yAxis: {
//       title: {
//           text: 'Season Total'
//       },
//       plotLines: [{
//           value: 0,
//           width: 1,
//           color: '#808080'
//       }]
//     },
//     legend: {
//       layout: 'vertical',
//       align: 'right',
//       verticalAlign: 'middle',
//       borderWidth: 0
//     },
//     series: [{
//       name: 'P.Kane',
//       data: [82, 46, 60, 106, 17, 30, 37, 21, 11, 40, .216, 17, 20, 0, 0, 9, 287, .160]
//     }, {
//       name: 'S.Crosby',
//       data: [80, 36, 49, 85, 19, 42, 90, 35, 986, 921, .517, 10, 14, 0, 0, 9, 248, .145]
//     }, {
//       name: 'A.Ovenchkin',
//       data: [79, 50, 21, 71, 21, 53, 225, 34, 0, 0, .000, 19, 5, 0, 0, 8, 398, .126]
//     }, {
//       name: 'D. Sedin',
//       data: [82, 28, 33, 61, 7, 36, 20, 19, 5, 14, .263, 8, 11, 0, 1, 6, 258, .109]
//     }]
//   });
// });