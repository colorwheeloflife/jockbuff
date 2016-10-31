$(function() {

  var userCheckedRows = [];

  $('#userTable').on('check.bs.table', function (e, row) {
    userCheckedRows.push({
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
    console.log(userCheckedRows);
  });

  $('#userTable').on('uncheck.bs.table', function (e, row) {
    $.each(userCheckedRows, function(index, value) {
      if (value.id === row.id) {
        userCheckedRows.splice(index,1);
      }
    });
    console.log(userCheckedRows);
  });

  $("#add_cart").click(function() {
    $("#user-output").empty();

    $.each(userCheckedRows, function(index, value) {
        $('#user-output').append($('<td></td>').text(value.name));
        $('#user-output').append($('<td></td>').text(value.pro_team));
        $('#user-output').append($('<td></td>').text(value.positions));
        $('#user-output').append($('<td></td>').text(value.yahoo_rank));
        $('#user-output').append($('<td></td>').text(value.jbr));
        $('#user-output').append($('<td></td>').text(value.g));
        $('#user-output').append($('<td></td>').text(value.a));
        $('#user-output').append($('<td></td>').text(value.p));
        $('#user-output').append($('<td></td>').text(value.ppp));
        $('#user-output').append($('<td></td>').text(value.plusminus));
        $('#user-output').append($('<td></td>').text(value.pim));
        $('#user-output').append($('<td></td>').text(value.sog));
        $('#user-output').append($('<td></td>').text(value.fow));
        $('#user-output').append($('<td></td>').text(value.hit));
        $('#user-output').append($('<td></td>').text(value.blk));
    });
    var td = $(".selected-players td");
    td.each(function(i){
      if (i % 15 == 0) {
          td.slice(i, i+15).wrapAll('<tr/>')
      }
    }).parent('tr').unwrap();
  });

  var checkedRows = [];

  $('.render_trade_table #otherTeamTable').on('check.bs.table', function (e, row) {
    checkedRows.push({
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
    console.log(checkedRows);
  });

  $('.render_trade_table #otherTeamTable').on('uncheck.bs.table', function (e, row) {
    $.each(checkedRows, function(index, value) {
      if (value.id === row.id) {
        checkedRows.splice(index,1);
      }
    });
    console.log(checkedRows);
  });

  $("#add_cart").click(function() {
    $("#trading_with_output").empty();

    $.each(checkedRows, function(index, value) {
        $('#trading_with_output').append($('<td></td>').text(value.name));
        $('#trading_with_output').append($('<td></td>').text(value.pro_team));
        $('#trading_with_output').append($('<td></td>').text(value.positions));
        $('#trading_with_output').append($('<td></td>').text(value.yahoo_rank));
        $('#trading_with_output').append($('<td></td>').text(value.jbr));
        $('#trading_with_output').append($('<td></td>').text(value.g));
        $('#trading_with_output').append($('<td></td>').text(value.a));
        $('#trading_with_output').append($('<td></td>').text(value.p));
        $('#trading_with_output').append($('<td></td>').text(value.ppp));
        $('#trading_with_output').append($('<td></td>').text(value.plusminus));
        $('#trading_with_output').append($('<td></td>').text(value.pim));
        $('#trading_with_output').append($('<td></td>').text(value.sog));
        $('#trading_with_output').append($('<td></td>').text(value.fow));
        $('#trading_with_output').append($('<td></td>').text(value.hit));
        $('#trading_with_output').append($('<td></td>').text(value.blk));
    });
  });


});
