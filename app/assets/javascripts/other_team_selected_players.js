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
    console.log(otherCheckedRowsSkaters);
  });

  $('#add-to-trade').on('click', function() {
    $("#other-output").empty();
    $.each(otherCheckedRowsSkaters, function(index, value) {
        var row = $('<tr>');
        $('#other-output').append(row);
          row.append($('<td>').addClass('name').text(value.name));
          row.append($('<td>').addClass('pro_team').text(value.pro_team));
          row.append($('<td>').addClass('pos').text(value.positions));
          row.append($('<td>').addClass('jbr').text(value.jbr));
          row.append($('<td>').addClass('goals').text(value.g));
          row.append($('<td>').addClass('assists').text(value.a));
          row.append($('<td>').addClass('points').text(value.p));
          row.append($('<td>').addClass('ppp').text(value.ppp));
          row.append($('<td>').addClass('plusminus').text(value.plusminus));
          row.append($('<td>').addClass('pim').text(value.pim));
          row.append($('<td>').addClass('sog').text(value.sog));
          row.append($('<td>').addClass('fow').text(value.fow));
          row.append($('<td>').addClass('hit').text(value.hit));
          row.append($('<td>').addClass('blk').text(value.blk));
        $('#other-output').trigger('otherplayerloaded');

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
    console.log(otherCheckedRowsGoalies);
  });

    $('#add-to-trade').on('click', function() {
    $("#other-output-goalies").empty();

    $.each(otherCheckedRowsGoalies, function(index, value) {
      var row = $('<tr>');
      $('#other-output-goalies').append(row);
        row.append($('<td>').addClass('other-goalies-for-trade name').text(value.name));
        row.append($('<td>').addClass('other-goalies-for-trade pro_team').text(value.pro_team));
        row.append($('<td>').addClass('other-goalies-for-trade goalie-jbr').text(value.jbr));
        row.append($('<td>').addClass('other-goalies-for-trade wins').text(value.w));
        row.append($('<td>').addClass('other-goalies-for-trade losses').text(value.l));
        row.append($('<td>').addClass('other-goalies-for-trade gaa').text(value.gaa));
        row.append($('<td>').addClass('other-goalies-for-trade svpercent').text(value.svpercent));
        row.append($('<td>').addClass('other-goalies-for-trade sho').text(value.sho));
        row.append($('<td>').addClass('other-goalies-for-trade sv').text(value.sv));
      $('#other-output-goalies').trigger('othergoalieloaded');

    });
  });
});