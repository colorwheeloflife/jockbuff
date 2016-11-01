$(function () {
  $('table.table tr td.player_name').draggable({
    revert : function(event, ui) {
      $(this).data("uiDraggable").originalPosition = {
          top : 0,
          left : 0
      };
      return !event;
  }
});

$('.dropspace').droppable({
  drop: function (event, ui) {
    selectedPlayer1 = (ui.draggable.attr('id'));
      alert(selectedPlayer1);

      // more magic goes here
      // $.ajax({
      //     url: "/players/",
      //     method: "GET",
      //     data: {DATA},
      //     success: function (data) {
      //         drawSpiderChart_top(data);
      //     }
      // });
  }
});
});


$(function () {
  $('#draggable li').draggable();
    $("#droppable").droppable({
      drop: function (event, ui) {
        alert(ui.draggable.attr('id'));
      }
    });
});
