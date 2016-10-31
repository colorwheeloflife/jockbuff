$(function() {

  var checkedRows = [];

  $('#userTable').on('check.bs.table', function (e, row) {
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

  $('#userTable').on('uncheck.bs.table', function (e, row) {
    $.each(checkedRows, function(index, value) {
      if (value.id === row.id) {
        checkedRows.splice(index,1);
      }
    });
    console.log(checkedRows);
  });

  $("#add_cart").click(function() {
    $("#user-output").empty();

    $.each(checkedRows, function(index, value) {
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
    var td = $(".selected-players td");                    // Getting all td
    td.each(function(i){                         // Looping the td
      if (i % 15 == 0) {                        // Splitting td as multiple of 3
          td.slice(i, i+15).wrapAll('<tr/>')    // Wrapping it inside tr
      }
    }).parent('tr').unwrap();
  });

});
