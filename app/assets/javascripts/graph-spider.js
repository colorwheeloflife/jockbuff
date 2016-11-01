// function drawSpiderChart (chartData) {
$(function () {
  var triggered = false;

  $('#spider_graph-top').waypoint(function(direction) {
      if(triggered) { return; }
      if (direction === 'down') {
        $('#spider_graph-top').highcharts(graph);
        triggered = true;
      }
    }, {
      offset: 'bottom-in-view'
    });

  var graph = {
    chart: {
      polar: true,
      type: 'line'
    },

    title: {
      text: 'Profile Outlook',
      x: -80
    },

    pane: {
      size: '80%'
    },

    xAxis: {
      categories: ['Goals', 'Assists', '+/-', 'Penalty Minutes',
                'Power-Play Points', 'Shots on Goal'],
      tickmarkPlacement: 'on',
      lineWidth: 0
    },

    yAxis: {
      gridLineInterpolation: 'polygon',
      lineWidth: 0,
      min: 0
    },

    tooltip: {
      shared: true,
      pointFormat: '<span style="color:{series.color}">{series.name}: <b>${point.y:,.0f}</b><br/>'
    },

    legend: {
      align: 'right',
      verticalAlign: 'top',
      y: 70,
      layout: 'vertical'
    },

    series: [{
      name: 'Best Player In League',
      data: [43, 19, 60, 35, 17, 100],
      pointPlacement: 'on'
    }, {
      name: 'Average Player In League',
      data: [30, 15, 42, 31, 26, 90],
      pointPlacement: 'on'
    }, {
      name: 'Player Selected',
      data: [31, 17, 29, 31, 20, 140],
      pointPlacement: 'on'
    }]
  };
});