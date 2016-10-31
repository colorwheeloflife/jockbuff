$(function() {

  var checkedRows = [];

  $('#userTable').on('check.bs.table', function (e, row) {
    checkedRows.push({
      name: row.name,
      pro_team: row.pro_team,
      positions: row.positions,
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
    $("#output").empty();
    $.each(checkedRows, function(index, value) {
      $('#output').append($('<td></td>').text(value.name));
      $('#output').append($('<td></td>').text(value.pro_team));
      $('#output').append($('<td></td>').text(value.positions));
      $('#output').append($('<td></td>').text(value.g));
      $('#output').append($('<td></td>').text(value.a));
      $('#output').append($('<td></td>').text(value.p));
      $('#output').append($('<td></td>').text(value.ppp));
      $('#output').append($('<td></td>').text(value.plusminus));
      $('#output').append($('<td></td>').text(value.pim));
      $('#output').append($('<td></td>').text(value.sog));
      $('#output').append($('<td></td>').text(value.fow));
      $('#output').append($('<td></td>').text(value.hit));
      $('#output').append($('<td></td>').text(value.blk));
    });
  });


  // $('body').on('click', '.inlineCheckbox1', function(e) {
  //   var player_id = $(e.target).val();
  //   if (this.checked) {
  //     console.log("IS GETTING CLICKED: " + player_id);

  //   }
  // });
});
