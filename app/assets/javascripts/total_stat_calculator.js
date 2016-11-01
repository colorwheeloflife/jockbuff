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

  totalCalcPercentage = function (tableTarget, statsTarget, renderTarget) {
    $(tableTarget).each(function () {
      var sum = 0
      $(this).find(statsTarget).each(function () {
          sum += +$(this).text() || 0;
      });
      $(renderTarget).html(sum.toFixed(2));
    });
  };

//////////////// COMPARES PAGE //////////////////////////

  //USER SKATERS//

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
  //fow total//
  totalCalc('#each-user-player', '.fow', '.total-fow');
  //hits total//
  totalCalc('#each-user-player', '.hit', '.total-hits');
  //blks total//
  totalCalc('#each-user-player', '.blk', '.total-blks' );
  //JBR total//
  totalCalc('#each-user-player', '.jbr-stat', '.total-jbr');

  //USER GOALIES//
  //Goalie wins total//
  totalCalc('#each-user-goalie', '.wins', '.total-wins');
  //Goalie JBR total//
  totalCalc('#each-user-goalie', '.losses', '.total-losses');
  //Goalie JBR total//
  totalCalcPercentage('#each-user-goalie', '.gaa', '.total-gaa');
  //Goalie JBR total//
  totalCalc('#each-user-goalie', '.ga', '.total-ga');
  //Goalie JBR total//
  totalCalcPercentage('#each-user-goalie', '.svpercent', '.total-svpercent');
  //Goalie JBR total//
  totalCalc('#each-user-goalie', '.saves', '.total-saves');
  //Goalie JBR total//
  totalCalc('#each-user-goalie', '.shutouts', '.total-shutouts');
  //Goalie JBR total//
  totalCalc('#each-user-goalie', '.goalie-jbr-stat', '.total-goalie-jbr');

  $('#otherTeamTable').bind('contentchanged', function(){
  // OTHER TEAM //
  //goal totals//
    totalCalc('#each-other-player','.goals', '.other-total-goals');
    //assist totals//
    totalCalc('#each-other-player', '.assists', '.other-total-assists');
    //points totals//
    totalCalc('#each-other-player', '.points', '.other-total-points');
    //powerplay totals///
    totalCalc('#each-other-player', '.powerplay','.other-total-powerplay');
    //plus-minus-totals//
    totalCalc('#each-other-player', '.plusminus', '.other-total-plusminus');
    //pims total//
    totalCalc('#each-other-player', '.pims', '.other-total-pims');
    //sog totals//
    totalCalc('#each-other-player', '.sog', '.other-total-sog');
    //hits total//
    totalCalc('#each-other-player', '.hit', '.other-total-hits');
    //blks total//
    totalCalc('#each-other-player', '.blk', '.other-total-blks' );
    //JBR total//
    totalCalc('#each-other-player', '.jbr-stat', '.other-total-jbr');

    //USER GOALIES//

    //Goalie wins total//
    totalCalc('#each-other-goalie', '.wins', '.other-total-wins');
    //Goalie JBR total//
    totalCalc('#each-other-goalie', '.losses', '.other-total-losses');
    //Goalie JBR total//
    totalCalcPercentage('#each-other-goalie', '.gaa', '.other-total-gaa');
    //Goalie JBR total//
    totalCalc('#each-other-goalie', '.ga', '.other-total-ga');
    //Goalie JBR total//
    totalCalcPercentage('#each-other-goalie', '.svpercent', '.other-total-svpercent');
    //Goalie JBR total//
    totalCalc('#each-other-goalie', '.saves', '.other-total-saves');
    //Goalie JBR total//
    totalCalc('#each-other-goalie', '.shutouts', '.other-total-shutouts');
    //Goalie JBR total//
    totalCalc('#each-other-goalie', '.goalie-jbr-stat', '.other-total-goalie-jbr');
  });

/////PLAYERS TO BE TRADED STATS//////////

  $('#user-output').bind('playerloaded', function() {
      totalCalc('#user-output', '.goals', '.total-trade-goals');
      totalCalc('#user-output', '.assists', '.total-trade-assists');
      totalCalc('#user-output', '.points', '.total-trade-points');
      totalCalc('#user-output', '.ppp', '.total-trade-ppp');
      totalCalc('#user-output', '.plusminus', '.total-trade-plusminus');
      totalCalc('#user-output', '.pim', '.total-trade-pims');
      totalCalc('#user-output', '.sog', '.total-trade-sog');
      totalCalc('#user-output', '.fow', '.total-trade-fow');
      totalCalc('#user-output', '.hit', '.total-trade-hits');
      totalCalc('#user-output', '.blk', '.total-trade-blks');
      totalCalc('#user-output', '.jbr', '.total-trade-jbr');


  });


//////////////// COMPARES PAGE //////////////////////////

});