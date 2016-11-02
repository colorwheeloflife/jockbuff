// function drawNegColChart_top (chartData) {
$(function () {
  $('#neg-value-column_top').highcharts({
    chart: {
      type: 'column'
    },
    title: {
      text: 'Category Leaderboard with Average as Equator'
    },
    subtitle: {
      text: 'Category: Total Overall'
    },
    xAxis: {
      categories: ['John', 'Jane', 'Joe', 'Jane', 'Jeffrey', 'Jack', 'James', 'Joseph']
    },
    credits: {
      enabled: false
    },
    series: [{
      name: 'John',
      data: [-1062.5]
    }, {
      name: 'Jane',
      data: [1937.5]
    }, {
      name: 'Joe',
      data: [437.5]
    }, {
      name: 'Jane',
      data: [-2062.5]
    }, {
      name: 'Jeffrey',
      data: [937.5]
    }, {
      name: 'Jack',
      data: [-1062.5]
    }, {
      name: 'James',
      data: [3937.5]
    }, {
      name: 'Joseph',
      data: [-3062.5]
    },
    ]
  });
});