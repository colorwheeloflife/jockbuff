$(function() {

  $('input[type="checkbox"]').click(function(e) {
    var player_id = $(e.target).val();
    if (this.checked) {

      $('.players_to_be_traded').html("");

      var spinner = new Spinner().spin()
      $('.players_to_be_traded').append(spinner.el)

      $.ajax({
        method: "GET",
        url: "/ajax/users/" + PageData.user_id + "/leagues/" + PageData.league_id + "/teams/" + "1",
        success: function(data){
          console.log("AJAX Happening");
          $('.players_to_be_traded').html(data);
          spinner.stop();
        },
        error: function() {
          spinner.stop()
        }
      })
    }
  });
});
