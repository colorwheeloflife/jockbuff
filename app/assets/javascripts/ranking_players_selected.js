$(function() {

  var selectedPlayers = [];
  var graph_data = [{
      name: 'P.Kane',
      data: [82, 46, 60, 106, 17, 30, 37, 21, 11, 40, .216, 17, 20, 0, 0, 9, 287, .160]
    }];

  $('#playersTable').on('check.bs.table', function (e, row) {
    selectedPlayers.push({
      id: row.id,
      name: row.name,
      pro_team: row.pro_team,
      positions: row.positions,
      yahoo_rank: row.yahoo_rank,
      jbr: row.jbr,
      g: row.g,
      a: row.a,
      p: row.p,
      ppg: row.ppg,
      ppa: row.ppa,
      ppp: row.ppp,
      plusminus: row.plusminus,
      shg: row.shg,
      sha: row.sha,
      shp: row.shp,
      gwg: row.gwg,
      gtg: row.gtg,
      pim: row.pim,
      sog: row.sog,
      shpercent: row.shpercent,
      fw: row.fw,
      fl: row.fl,
      hit: row.hit,
      blk: row.blk
    });
    console.log(selectedPlayers);
  });


  $('#playersTable').on('uncheck.bs.table', function (e, row) {
    $.each(selectedPlayers, function(index, value) {
      if (value.id === row.id) {
        selectedPlayers.splice(index,1);
      }
    });
    console.log(selectedPlayers);
  });


  $("#add_player").click(function() {
    $("#selection-output").empty();
    $.each(selectedPlayers, function(index, value) {
      var row = $('<tr>');
      var pp = gon.player_passports;
      $('#selection-output').append(row);
      row.append($('<td>').text(value.name));
      row.append($('<td>').text(value.pro_team));
      row.append($('<td>').text(value.positions));
      row.append($('<td>').text(value.yahoo_rank));
      row.append($('<td>').text(value.jbr));
      row.append($('<td>').text(value.g));
      row.append($('<td>').text(value.a));
      row.append($('<td>').text(value.p));
      row.append($('<td>').text(value.ppg));
      row.append($('<td>').text(value.ppa));
      row.append($('<td>').text(value.ppp));
      row.append($('<td>').text(value.plusminus));
      row.append($('<td>').text(value.shg));
      row.append($('<td>').text(value.sha));
      row.append($('<td>').text(value.shp));
      row.append($('<td>').text(value.gwg));
      row.append($('<td>').text(value.gtg));
      row.append($('<td>').text(value.pim));
      row.append($('<td>').text(value.sog));
      row.append($('<td>').text(value.shpercent));
      row.append($('<td>').text(value.fw));
      row.append($('<td>').text(value.fl));
      row.append($('<td>').text(value.hit));
      row.append($('<td>').text(value.blk));
    });
    $.each(selectedPlayers, function(index, value) {
      var data = [];
      var player_data = {
        name: value.name,
        data: data
      };

      data.push(value.yahoo_rank);
      data.push(value.jbr);
      data.push(value.g);
      data.push(value.a);
      data.push(value.p);
      data.push(value.ppg);
      data.push(value.ppa);
      data.push(value.ppp);
      data.push(value.plusminus);
      data.push(value.shg);
      data.push(value.sha);
      data.push(value.shp);
      data.push(value.gwg);
      data.push(value.gtg);
      data.push(value.pim);
      data.push(value.sog);
      data.push(value.shpercent);
      data.push(value.fw);
      data.push(value.fl);
      data.push(value.hit);
      data.push(value.blk);

      graph_data.push(player_data);
      console.log(data);
      console.log(player_data);
      console.log(value);
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
      categories: [
      'Y!',
      'JBR',
      'G',
      'A',
      'P',
      'PPG',
      'PPA',
      'PPP',
      '+/-',
      'SHG',
      'SHA',
      'SHP',
      'GWG',
      'GTG',
      'SOG',
      'SH%',
      'FW', 'FL', 'HIT', 'BLK', 'TOTAL']
    },
    yAxis: {
      title: {
          text: 'Season Total'
      },
      plotLines: [{
          value: 0,
          width: 1,
          color: '#808080'
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
        categories: [
        'Y!',
        'JBR',
        'G',
        'A',
        'P',
        'PPG',
        'PPA',
        'PPP',
        '+/-',
        'SHG',
        'SHA',
        'SHP',
        'GWG',
        'GTG',
        'SOG',
        'SH%',
        'FW', 'FL', 'HIT', 'BLK', 'TOTAL']
      },
      yAxis: {
        title: {
            text: 'Season Total'
        },
        plotLines: [{
            value: 0,
            width: 1,
            color: '#808080'
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














// row.append($('<td>').text(value.name));
// row.append($('<td>').text(value.pro_team));
// row.append($('<td>').text(value.positions));
// row.append($('<td>').text(value.yahoo_rank));
// row.append($('<td>').text(value.jbr));
// if (value.g == true) { row.append($('<td>').text(value.g)); }
// if (value.a == true) { row.append($('<td>').text(value.a)); }
// if (value.p == true) { row.append($('<td>').text(value.p)); }
// if (value.ppg == true) { row.append($('<td>').text(value.ppg)); }
// if (value.ppa == true) { row.append($('<td>').text(value.ppa)); }
// if (value.ppp == true) { row.append($('<td>').text(value.ppp)); }
// if (value.plusminus == true) { row.append($('<td>').text(value.plusminus)); }
// if (value.shg == true) { row.append($('<td>').text(value.shg)); }
// if (value.sha == true) { row.append($('<td>').text(value.sha)); }
// if (value.shp == true) { row.append($('<td>').text(value.shp)); }
// if (value.gwg == true) { row.append($('<td>').text(value.gwg)); }
// if (value.gtg == true) { row.append($('<td>').text(value.gtg)); }
// if (value.pim == true) { row.append($('<td>').text(value.pim)); }
// if (value.sog == true) { row.append($('<td>').text(value.sog)); }
// if (value.shpercent == true) { row.append($('<td>').text(value.shpercent)); }
// if (value.fw == true) { row.append($('<td>').text(value.fw)); }
// if (value.fl == true) { row.append($('<td>').text(value.fl)); }
// if (value.hit == true) { row.append($('<td>').text(value.hit)); }
// if (value.blk == true) { row.append($('<td>').text(value.blk)); }




// if (value.g == true) { row.append($('<td>').text(value.g)); }
// if (pp[0].league.player_category.a == true) { row.append($('<td>').text(value.a)); }
// if (pp[0].league.player_category.p == true) { row.append($('<td>').text(value.p)); }
// if (pp[0].league.player_category.ppg == true) { row.append($('<td>').text(value.ppg)); }
// if (pp[0].league.player_category.ppa == true) { row.append($('<td>').text(value.ppa)); }
// if (pp[0].league.player_category.ppp == true) { row.append($('<td>').text(value.ppp)); }
// if (pp[0].league.player_category.plusminus == true) { row.append($('<td>').text(value.plusminus)); }
// if (pp[0].league.player_category.shg == true) { row.append($('<td>').text(value.shg)); }
// if (pp[0].league.player_category.sha == true) { row.append($('<td>').text(value.sha)); }
// if (pp[0].league.player_category.shp == true) { row.append($('<td>').text(value.shp)); }
// if (pp[0].league.player_category.gwg == true) { row.append($('<td>').text(value.gwg)); }
// if (pp[0].league.player_category.gtg == true) { row.append($('<td>').text(value.gtg)); }
// if (pp[0].league.player_category.pim == true) { row.append($('<td>').text(value.pim)); }
// if (pp[0].league.player_category.sog == true) { row.append($('<td>').text(value.sog)); }
// if (pp[0].league.player_category.shpercent == true) { row.append($('<td>').text(value.shpercent)); }
// if (pp[0].league.player_category.fw == true) { row.append($('<td>').text(value.fw)); }
// if (pp[0].league.player_category.fl == true) { row.append($('<td>').text(value.fl)); }
// if (pp[0].league.player_category.hit == true) { row.append($('<td>').text(value.hit)); }
// if (pp[0].league.player_category.blk == true) { row.append($('<td>').text(value.blk)); }








// $(function() {
//   $(".").on("change", function(e) {
//     var team_id = $(e.target).val();
//     $('.render_trade_table').html("");

//     var spinner = new Spinner().spin()
//     $('.render_trade_table').append(spinner.el)

//     $.ajax({
//       method: "GET",
//       url: "/ajax/users/" + PageData.user_id + "/leagues/" + PageData.league_id + "/teams/" + team_id,
//       success: function(data){
//         $('.render_trade_table').html(data);
//         spinner.stop();
//       },
//       error: function() {
//         spinner.stop()
//       }
//     })
//   });

// });






// $(function() {

//   $(".team-selector").on("change", function(e) {
//     var team_id = $(e.target).val();
//     $('.render_trade_table').html("");

//     var spinner = new Spinner().spin()
//     $('.render_trade_table').append(spinner.el)

//     $.ajax({
//       method: "GET",
//       url: "/ajax/users/" + PageData.user_id + "/leagues/" + PageData.league_id + "/teams/" + team_id,
//       success: function(data){
//         $('.render_trade_table').html(data);
//         spinner.stop();
//       },
//       error: function() {
//         spinner.stop()
//       }
//     })
//   });

// });