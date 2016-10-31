var selectedPlayers = [];

$('#playersTable').on('check.bs.table', function (e, row) {
  selectedPlayers.push({
    id: row.id,
    name: row.name,
    pro_team: row.pro_team,
    positions: row.positions,
    yahoo_rank: yahoo_rank,
    jbr: jbr,
    g: g,
    a: a,
    p: p,
    ppg: ppg,
    ppa: ppa,
    ppp: ppp,
    plusminus: plusminus,
    shg: shg,
    sha: sha,
    shp: shp,
    gwg: gwg,
    gtg: gtg,
    pim: pim,
    sog: sog,
    shpercent: shpercent,
    fw: fw,
    fl: fl,
    hit: hit,
    blk: blk
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
    $("#selection-output").append($('<td></td>').text(value.name));
    $("#selection-output").append($('<td></td>').text(value.pro_team));
    $("#selection-output").append($('<td></td>').text(value.positions));
    $("#selection-output").append($('<td></td>').text(value.yahoo_rank));
    $("#selection-output").append($('<td></td>').text(value.jbr));
    $("#selection-output").append($('<td></td>').text(value.g));
    $("#selection-output").append($('<td></td>').text(value.a));
    $("#selection-output").append($('<td></td>').text(value.p));
    $("#selection-output").append($('<td></td>').text(value.ppg));
    $("#selection-output").append($('<td></td>').text(value.ppa));
    $("#selection-output").append($('<td></td>').text(value.ppp));
    $("#selection-output").append($('<td></td>').text(value.plusminus));
    $("#selection-output").append($('<td></td>').text(value.shg));
    $("#selection-output").append($('<td></td>').text(value.sha));
    $("#selection-output").append($('<td></td>').text(value.shp));
    $("#selection-output").append($('<td></td>').text(value.gwg));
    $("#selection-output").append($('<td></td>').text(value.gtg));
    $("#selection-output").append($('<td></td>').text(value.pim));
    $("#selection-output").append($('<td></td>').text(value.sog));
    $("#selection-output").append($('<td></td>').text(value.shpercent));
    $("#selection-output").append($('<td></td>').text(value.fw));
    $("#selection-output").append($('<td></td>').text(value.fl));
    $("#selection-output").append($('<td></td>').text(value.hit));
    $("#selection-output").append($('<td></td>').text(value.blk));
  });
});
