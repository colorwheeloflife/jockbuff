$(function() {
  var otherCheckedRowsSkaters = [];


/* TAKES OTHER TEAM SELECTED PLAYERS STATS AND PUTS THEM IN OBJECT, THEN PUSH TO ARRAY FOR FUTURE USE */

  $('.trading-teams').on('check.bs.table', '#otherTable', function (e, row) {
    otherCheckedRowsSkaters.push(row);
  });

/* Unchecks selected other team players (ONLY SLICES, NEEDS IMPROVEMENT) */

  $('.trading-teams').on('uncheck.bs.table', '#otherTable', function (e, row) {
    $.each(otherCheckedRowsSkaters, function(index, value) {
      if (value.id === row.id) {
        otherCheckedRowsSkaters.splice(index,1);
      }
    });
  });


/* ON CLICK, ADDS EACH OTHER TEAM SELECTED PLAYERS STATLINE TO A ROW, AND SENDIN THAT ROW TO THE HTML */

  $('#add-to-trade').on('click', function() {
    $("#other-output").empty();
    $.each(otherCheckedRowsSkaters, function(index, value) {
        var row = $('<tr>');
        $('#other-output').append(row);
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
  });




/* OTHER TEAM GOALIES GOALIES GOALIES */

  // var otherCheckedRowsGoalies = [];

// $('.trading-teams').on('check.bs.table', '#otherGoalieTable', function (e, row) {
//     otherCheckedRowsGoalies.push(row);
//     console.log(otherCheckedRowsGoalies);
//   });

  // $('.trading-teams').on('uncheck.bs.table', '#otherGoalieTable', function (e, row) {
  //   $.each(otherCheckedRowsGoalies, function(index, value) {
  //     if (value.id === row.id) {
  //       otherCheckedRowsGoalies.splice(index,1);
  //     }
  //   });
  //   console.log(otherCheckedRowsGoalies);
  // });

  //   $('#add-to-trade').on('click', function() {
  //   $("#other-output-goalies").empty();

  //   $.each(otherCheckedRowsGoalies, function(index, value) {
  //     var row = $('<tr>');
  //     $('#other-output-goalies').append(row);
  //     row.append($('<td>').text(value.name));
  //     row.append($('<td>').text(value.pro_team));
  //     row.append($('<td>').text(value.yahoo_rank));
  //     row.append($('<td>').text(value.jbr));
  //     row.append($('<td>').text(value.w));
  //     row.append($('<td>').text(value.l));
  //     row.append($('<td>').text(value.gaa));
  //     row.append($('<td>').text(value.svpercent));
  //     row.append($('<td>').text(value.sho));
  //     row.append($('<td>').text(value.sv));
  //   });
  // });

});