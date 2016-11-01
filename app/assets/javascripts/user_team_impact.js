$(document).ready(function () {

  totalCalc = function (tableTarget, statsTarget, renderTarget) {
    $(tableTarget).each(function () {
      var sum = 0
      $(this).find(statsTarget).each(function () {
          sum += +$(this).text() || 0;
      });
      $(renderTarget).html(sum);
    });
  };

  //goal totals//
  totalCalc('#each-user-player','.goals','.total-goals');
  //assist totals//
  totalCalc('#each-user-player', '.assists', '.total-assists');
  //points totals//
  totalCalc('#each-user-player', '.points', '.total-points');
  //powerplay totals///
  totalCalc('#each-user-player', '.powerplay','.total-powerplay');
  //plus-minus-totals//
  totalCalc('#each-user-player', '.plusminus', '.total-plusminus');
  //pims total//
  totalCalc('#each-user-player', '.pims', '.total-pims');
  //sog totals//
  totalCalc('#each-user-player', '.sog', '.total-sog');
  //hits total//
  totalCalc('#each-user-player', '.hit', '.total-hits');
  //blks total//
  totalCalc('#each-user-player', '.blk', '.total-blks' );
  //JBR total//
  totalCalc('#each-user-player', '.jbr-stat', '.total-jbr');

});