 $(function() {

  var otherCheckedRowsSkaters = [];

  $('.trading-teams').on('check.bs.table', '#otherTable', function (e, row) {
    otherCheckedRowsSkaters.push({
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

  $('.trading-teams').on('uncheck.bs.table', '#otherTable', function (e, row) {
    $.each(otherCheckedRowsSkaters, function(index, value) {
      if (value.id === row.id) {
        otherCheckedRowsSkaters.splice(index,1);
      }
    });
    console.log(otherCheckedRowsSkaters);
  });

  $('#add-to-trade').on('click', function() {
    $("#other-output").empty();

    $.each(otherCheckedRowsSkaters, function(index, value) {
        var row = $('<tr>');
        $('#other-output').append(row);
        row.append($('<td>').text(value.name));
        row.append($('<td>').text(value.pro_team));
        row.append($('<td>').text(value.positions));
        row.append($('<td>').text(value.yahoo_rank));
        row.append($('<td>').text(value.jbr));
        row.append($('<td>').text(value.g));
        row.append($('<td>').text(value.a));
        row.append($('<td>').text(value.p));
        row.append($('<td>').text(value.ppp));
        row.append($('<td>').text(value.plusminus));
        row.append($('<td>').text(value.pim));
        row.append($('<td>').text(value.sog));
        row.append($('<td>').text(value.fow));
        row.append($('<td>').text(value.hit));
        row.append($('<td>').text(value.blk));
    });
  });

  var otherCheckedRowsGoalies = [];

  $('.trading-teams').on('check.bs.table', '#otherGoalieTable', function (e, row) {
    otherCheckedRowsGoalies.push({
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
    console.log(otherCheckedRowsGoalies);
  });

  $('.trading-teams').on('uncheck.bs.table', '#otherGoalieTable', function (e, row) {
    $.each(otherCheckedRowsGoalies, function(index, value) {
      if (value.id === row.id) {
        otherCheckedRowsGoalies.splice(index,1);
      }
    });
    console.log(otherCheckedRowsGoalies);
  });

    $('#add-to-trade').on('click', function() {
    $("#other-output-goalies").empty();

    $.each(otherCheckedRowsGoalies, function(index, value) {
      var row = $('<tr>');
      $('#other-output-goalies').append(row);
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