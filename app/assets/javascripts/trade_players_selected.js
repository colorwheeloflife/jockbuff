$(function() {

  $('body').on('click', '.inlineCheckbox1', function(e) {
    var player_id = $(e.target).val();
    if (this.checked) {
      console.log("IS GETTING CLICKED: " + player_id);


    }
  });
});
