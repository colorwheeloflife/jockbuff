$(function() {
  var otherCheckedRowsSkaters = [];

  $('.trading-teams').on('check.bs.table', '#otherTable', function (e, row) {
    otherCheckedRowsSkaters.push(row);
  });

  $('.trading-teams').on('uncheck.bs.table', '#otherTable', function (e, row) {
    $.each(otherCheckedRowsSkaters, function(index, value) {
      if (value.id === row.id) {
        otherCheckedRowsSkaters.splice(index,1);
      }
    });
  });

  $('#add-to-trade').on('click', function() {
    $("#other-output").empty();
    $.each(otherCheckedRowsSkaters, function(index, value) {
        var row = $('<tr>');
        $('#other-output').append(row);
        row.append($('<td>').text(value.name));
        row.append($('<td>').text(value.pro_team));
        row.append($('<td>').text(value.positions));
        row.append($('<td>').text(value.jbr));
        if (value.g !== undefined) { row.append($('<td>').text(value.g)); }
        if (value.a !== undefined) { row.append($('<td>').text(value.a)); }
        if (value.p !== undefined) { row.append($('<td>').text(value.p)); }
        if (value.ppg !== undefined) { row.append($('<td>').text(value.ppg)); }
        if (value.ppa !== undefined) { row.append($('<td>').text(value.ppa)); }
        if (value.ppp !== undefined) { row.append($('<td>').text(value.ppp)); }
        if (value.plusminus !== undefined) { row.append($('<td>').text(value.plusminus)); }
        if (value.shg !== undefined) { row.append($('<td>').text(value.shg)); }
        if (value.sha !== undefined) { row.append($('<td>').text(value.sha)); }
        if (value.shp !== undefined) { row.append($('<td>').text(value.shp)); }
        if (value.gwg !== undefined) { row.append($('<td>').text(value.gwg)); }
        if (value.gtg !== undefined) { row.append($('<td>').text(value.gtg)); }
        if (value.pim !== undefined) { row.append($('<td>').text(value.pim)); }
        if (value.sog !== undefined) { row.append($('<td>').text(value.sog)); }
        if (value.shpercent !== undefined) { row.append($('<td>').text(value.shpercent)); }
        if (value.fw !== undefined) { row.append($('<td>').text(value.fw)); }
        if (value.fl !== undefined) { row.append($('<td>').text(value.fl)); }
        if (value.hit !== undefined) { row.append($('<td>').text(value.hit)); }
        if (value.blk !== undefined) { row.append($('<td>').text(value.blk)); }
    });
  });



  var otherCheckedRowsGoalies = [];

  $('.trading-teams').on('check.bs.table', '#otherGoalieTable', function (e, row) {
    otherCheckedRowsGoalies.push(row);
    console.log(otherCheckedRowsGoalies);
  });

  $('.trading-teams').on('uncheck.bs.table', '#otherGoalieTable', function (e, row) {
    $.each(otherCheckedRowsGoalies, function(index, value) {
      if (value.id === row.id) {
        otherCheckedRowsGoalies.splice(index,1);
      }
    });
  });

  $('#add-to-trade').on('click', function() {
    $("#other-output-goalies").empty();
    $.each(otherCheckedRowsGoalies, function(index, value) {
      var row = $('<tr>');
      $('#other-output-goalies').append(row);
      row.append($('<td>').text(value.name));
      row.append($('<td>').text(value.pro_team));
      row.append($('<td>').text(value.jbr));
      if (value.gs !== undefined) { row.append($('<td>').text(value.gs)); }
      if (value.w !== undefined) { row.append($('<td>').text(value.w)); }
      if (value.l !== undefined) { row.append($('<td>').text(value.l)); }
      if (value.ga !== undefined) { row.append($('<td>').text(value.ga)); }
      if (value.gaa !== undefined) { row.append($('<td>').text(value.gaa)); }
      if (value.sa !== undefined) { row.append($('<td>').text(value.sa)); }
      if (value.sec !== undefined) { row.append($('<td>').text(value.sec)); }
      if (value.sv !== undefined) { row.append($('<td>').text(value.sv)); }
      if (value.svpercent !== undefined) { row.append($('<td>').text(value.svpercent)); }
      if (value.sho !== undefined) { row.append($('<td>').text(value.sho)); }
    });
  });
});