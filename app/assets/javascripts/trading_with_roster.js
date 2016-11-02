$(function() {
  $(".team-selector").on("change", function(e) {
    var team_id = $(e.target).val();
    $('.render_trade_table').html("");
    var spinner = new Spinner().spin()
    $('.render_trade_table').append(spinner.el)

    $.ajax({
      method: "GET",
      url: "/ajax/users/" + PageData.user_id + "/leagues/" + PageData.league_id + "/teams/" + team_id,
      success: function(data){
        $('.render_trade_table').html(data).find('table').bootstrapTable();
        $('#otherTeamTable').trigger('contentchanged');
        spinner.stop();
      },
      error: function() {
        spinner.stop()
      }
    })
  });
});