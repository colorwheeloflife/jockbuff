$(function() {

  var selectedPlayers = [];

  var graph_data = [{
      name: 'P.Kane',
      data: [100, 82, 46, 60, 106, 17, 30, 37, 21, 11, 40, .216, 17, 20, 0, 0, 9, 287, .160]
    }];

  var graph_categories = ['JBR', 'G', 'A', 'P', 'PPG', 'PPA', 'PPP', '+/-', 'SHG', 'SHA', 'SHP', 'GWG', 'GTG', 'SOG', 'SH%', 'FW', 'FL', 'HIT', 'BLK', 'TOTAL'];

  var graph_colors = ["#000000", "#23395B", "#008DD5", "#8EB1C7", "#5AFF15", "#FFBC42", "#EB4511", "#F45866", "#EE0000", "#9932CD"];

  function colorer (array) {
    var index = Math.random(0, array.length);
    return array[index];
  }



  $('#playersTable').on('check.bs.table', function (e, row) {
    selectedPlayers.push(row);
  });

  $('#playersTable').on('uncheck.bs.table', function (e, row) {
    $.each(selectedPlayers, function(index, value) {
      if (value.id === row.id) {
        selectedPlayers.splice(index,1);
        console.log(index);
      }
    });
  });

  $("#add_player").click(function() {
    $("#selection-output").empty();
    $.each(selectedPlayers, function(index, value) {
      var row = $('<tr>');
      $('#selection-output').append(row);
      row.addClass(value.id);
      row.append($('<td>').text(value.name));
      row.append($('<td>').text(value.pro_team));
      row.append($('<td>').text(value.positions));
      row.append($('<td>').text(value.jbr));
      if (value.g != undefined) { row.append($('<td>').text(value.g)); }
      if (value.a != undefined) { row.append($('<td>').text(value.a)); }
      if (value.p != undefined) { row.append($('<td>').text(value.p)); }
      if (value.ppg != undefined) { row.append($('<td>').text(value.ppg)); }
      if (value.ppa != undefined) { row.append($('<td>').text(value.ppa)); }
      if (value.ppp != undefined) { row.append($('<td>').text(value.ppp)); }
      if (value.plusminus != undefined) { row.append($('<td>').text(value.plusminus)); }
      if (value.shg != undefined) { row.append($('<td>').text(value.shg)); }
      if (value.sha != undefined) { row.append($('<td>').text(value.sha)); }
      if (value.shp != undefined) { row.append($('<td>').text(value.shp)); }
      if (value.gwg != undefined) { row.append($('<td>').text(value.gwg)); }
      if (value.gtg != undefined) { row.append($('<td>').text(value.gtg)); }
      if (value.pim != undefined) { row.append($('<td>').text(value.pim)); }
      if (value.sog != undefined) { row.append($('<td>').text(value.sog)); }
      if (value.shpercent != undefined) { row.append($('<td>').text(value.shpercent)); }
      if (value.fw != undefined) { row.append($('<td>').text(value.fw)); }
      if (value.fl != undefined) { row.append($('<td>').text(value.fl)); }
      if (value.hit != undefined) { row.append($('<td>').text(value.hit)); }
      if (value.blk != undefined) { row.append($('<td>').text(value.blk)); }
    });
    $.each(selectedPlayers, function(index, value) {
      var data = [];
      var player_data = {
        name: value.name,
        data: data
      };
      data.push(parseInt(value.jbr));
      if (value.g != undefined) { data.push(parseInt(value.g)); }
      if (value.a != undefined) { data.push(parseInt(value.a)); }
      if (value.p != undefined) { data.push(parseInt(value.p)); }
      if (value.ppg != undefined) { data.push(parseInt(value.ppg)); }
      if (value.ppa != undefined) { data.push(parseInt(value.ppa)); }
      if (value.ppp != undefined) { data.push(parseInt(value.ppp)); }
      if (value.plusminus != undefined) { data.push(parseInt(value.plusminus)); }
      if (value.shg != undefined) { data.push(parseInt(value.shg)); }
      if (value.sha != undefined) { data.push(parseInt(value.sha)); }
      if (value.shp != undefined) { data.push(parseInt(value.shp)); }
      if (value.gwg != undefined) { data.push(parseInt(value.gwg)); }
      if (value.gtg != undefined) { data.push(parseInt(value.gtg)); }
      if (value.pim != undefined) { data.push(parseInt(value.pim)); }
      if (value.sog != undefined) { data.push(parseInt(value.sog)); }
      if (value.shpercent != undefined) { data.push(parseInt(value.shpercent)); }
      if (value.fw != undefined) { data.push(parseInt(value.fw)); }
      if (value.fl != undefined) { data.push(parseInt(value.fl)); }
      if (value.hit != undefined) { data.push(parseInt(value.hit)); }
      if (value.blk != undefined) { data.push(parseInt(value.blk)); }

      graph_data.push(player_data);
      linegraph();
    });
  });

  $('#line_graph-top').highcharts({
      title: {
        text: 'Player Stats',
        x: -20 //center
      },
      subtitle: {
        text: 'Source: Yahoo Fantasy Sports',
        x: -20
      },
      xAxis: {
        categories: graph_categories
      },
      yAxis: {
        title: {
            text: 'Season Total'
        },
        plotLines: [{
            value: 0,
            width: 1,
            color: "#000000"
        }]
      },
      legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle',
        borderWidth: 0
      },
      series: graph_data
      }
    );


  function linegraph () {
    $('#line_graph-top').highcharts({
      title: {
        text: 'Player Stats',
        x: -20 //center
      },
      subtitle: {
        text: 'Source: Yahoo Fantasy Sports',
        x: -20
      },
      xAxis: {
        categories: graph_categories
      },
      yAxis: {
        title: {
            text: 'Season Total'
        },
        plotLines: [{
            value: 0,
            width: 1,
            color: "#000000"
        }]
      },
      legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle',
        borderWidth: 0
      },
      series: graph_data
    });
  }

});