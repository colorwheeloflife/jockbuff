// function drawRankColChart_top (chartData) {
$(function () {
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
          categories: ['Mark', 'Jacob', 'Larry', 'Bob', 'Derek', 'Chris', 'Daniel', 'Sarah', 'Taylor', 'Mitch', 'Alex', 'Devin']
      },
      series: [{
          data: [1000, 900, 900, 800, 700, 600, 600, 500, 400, 300, 200, 100]
      }]
  });
});