$(function() {

  var userCheckedRowsSkaters = [];

    $('#userTable').on('check.bs.table', function (e, row) {
      userCheckedRowsSkaters.push({
        name: row.name,
        pro_team: row.pro_team,
        positions: row.positions,
        yahoo_rank: row.yahoo_rank,
        jbr: row.jbr,
        g: row.g,
        a: row.a,
        p: row.p,
        ppp: row.ppp,
        plusminus: row.plusminus,
        pim: row.pim,
        sog: row.sog,
        fow: row.fow,
        hit: row.hit,
        blk: row.blk
      });
    });

  $('#userTable').on('uncheck.bs.table', function (e, row) {
    $.each(userCheckedRowsSkaters, function(index, value) {
      if (value.id === row.id) {
        userCheckedRowsSkaters.splice(index,1);
      }
    });
    console.log(userCheckedRowsSkaters);
  });

  $('#add-to-trade').on('click', function() {
    $("#user-output").empty();

    $.each(userCheckedRowsSkaters, function(index, value) {
        var row = $('<tr>');
        $('#user-output').append(row);
        row.append($('<td>').addClass().text(value.name));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.pro_team));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.positions));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.yahoo_rank));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.jbr));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.g));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.a));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.p));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.ppp));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.plusminus));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.pim));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.sog));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.fow));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.hit));
        row.append($('<td>').addClass('.selected-players-for-trade').text(value.blk));
    });
  });

  var checkedRowsGoalies = [];

  $('#userGoalieTable').on('check.bs.table', function (e, row) {
    checkedRowsGoalies.push({
      name: row.name,
      pro_team: row.pro_team,
      positions: row.positions,
      yahoo_rank: row.yahoo_rank,
      jbr: row.jbr,
      w: row.w,
      l: row.l,
      gaa: row.gaa,
      svpercent: row.svpercent,
      sho: row.sho,
      sv: row.sv,
    });
    console.log(checkedRowsGoalies);
  });


  $('#userGoalieTable').on('uncheck.bs.table', function (e, row) {
    $.each(checkedRowsGoalies, function(index, value) {
      if (value.id === row.id) {
        checkedRowsGoalies.splice(index,1);
      }
    });
    console.log(checkedRowsGoalies);
  });

  $('#add-to-trade').on('click', function() {
    $("#user-output-goalies").empty();

    $.each(checkedRowsGoalies, function(index, value) {
      var row = $('<tr>');
      $('#user-output-goalies').append(row);
      row.append($('<td>').text(value.name));
      row.append($('<td>').text(value.pro_team));
      row.append($('<td>').text(value.yahoo_rank));
      row.append($('<td>').text(value.jbr));
      row.append($('<td>').text(value.w));
      row.append($('<td>').text(value.l));
      row.append($('<td>').text(value.gaa));
      row.append($('<td>').text(value.svpercent));
      row.append($('<td>').text(value.sho));
      row.append($('<td>').text(value.sv));
    });
  });

});
