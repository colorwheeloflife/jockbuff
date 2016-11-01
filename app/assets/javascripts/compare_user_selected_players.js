$(function() {
  var userCheckedRowsSkaters = [];

  $('#userTable').on('check.bs.table', function (e, row) {
    userCheckedRowsSkaters.push(row);
  });

  $('#userTable').on('uncheck.bs.table', function (e, row) {
    $.each(userCheckedRowsSkaters, function(index, value) {
      if (value.id === row.id) {
        userCheckedRowsSkaters.splice(index,1);
      }
    });
  });

  $('#add-to-trade').on('click', function() {
    $("#user-output").empty();
    $.each(userCheckedRowsSkaters, function(index, value) {
        var row = $('<tr>');
        $('#user-output').append(row);
        row.append($('<td>').addClass().text(value.name));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.pro_team));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.positions));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.jbr));
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



  var checkedRowsGoalies = [];

  $('#userGoalieTable').on('check.bs.table', function (e, row) {
    checkedRowsGoalies.push(row);
  });


  $('#userGoalieTable').on('uncheck.bs.table', function (e, row) {
    $.each(checkedRowsGoalies, function(index, value) {
      if (value.id === row.id) {
        checkedRowsGoalies.splice(index,1);
      }
    });
  });
  $('#add-to-trade').on('click', function() {
    $("#user-output-goalies").empty();

    $.each(checkedRowsGoalies, function(index, value) {
      var row = $('<tr>');
      $('#user-output-goalies').append(row);
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
});