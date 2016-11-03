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
      $("#hidden-trades").removeClass('hidden');
      $("#user-output").empty();
      $.each(userCheckedRowsSkaters, function(index, value) {
        var row = $('<tr>');
        $('#user-output').append(row);
        row.append($('<td>').addClass('selected-players-for-trade name').text(value.name));
        row.append($('<td>').addClass('selected-players-for-trade pro_team').text(value.pro_team));
        row.append($('<td>').addClass('selected-players-for-trade pos').text(value.positions));
        row.append($('<td>').addClass('selected-players-for-trade jbr').text(value.jbr));
        row.append($('<td>').addClass('selected-players-for-trade goals').text(value.g));
        row.append($('<td>').addClass('selected-players-for-trade assists').text(value.a));
        row.append($('<td>').addClass('selected-players-for-trade points').text(value.p));
        row.append($('<td>').addClass('selected-players-for-trade ppp').text(value.ppp));
        row.append($('<td>').addClass('selected-players-for-trade plusminus').text(value.plusminus));
        row.append($('<td>').addClass('selected-players-for-trade pim').text(value.pim));
        row.append($('<td>').addClass('selected-players-for-trade sog').text(value.sog));
        row.append($('<td>').addClass('selected-players-for-trade fow').text(value.fow));
        row.append($('<td>').addClass('selected-players-for-trade hit').text(value.hit));
        row.append($('<td>').addClass('selected-players-for-trade blk').text(value.blk));
        $('#user-output').trigger('playerloaded');
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
      row.append($('<td>').addClass('selected-goalies-for-trade name').text(value.name));
      row.append($('<td>').addClass('selected-goalies-for-trade pro_team').text(value.pro_team));
      row.append($('<td>').addClass('selected-goalies-for-trade goalie-jbr').text(value.jbr));
      row.append($('<td>').addClass('selected-goalies-for-trade wins').text(value.w));
      row.append($('<td>').addClass('selected-goalies-for-trade losses').text(value.l));
      row.append($('<td>').addClass('selected-goalies-for-trade gaa').text(value.gaa));
      row.append($('<td>').addClass('selected-goalies-for-trade svpercent').text(value.svpercent));
      row.append($('<td>').addClass('selected-goalies-for-trade sho').text(value.sho));
      row.append($('<td>').addClass('selected-goalies-for-trade sv').text(value.sv));
      $('#user-output-goalies').trigger('goalieloaded');

    });
  });

});
