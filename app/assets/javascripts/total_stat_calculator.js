$(document).ready(function () {

  totalCalc = function (tableTarget, statsTarget, renderTarget) {
    $(tableTarget).each(function() {
      var sum = 0
      $(this).find(statsTarget).each(function() {
          sum += +$(this).text() || 0;
      });
      $(renderTarget).html(sum);
    });
  };

  totalCalcPercentage = function (tableTarget, statsTarget, renderTarget) {
    $(tableTarget).each(function() {
      var sum = 0
      $(this).find(statsTarget).each(function() {
          sum += +$(this).text() || 0;
      });
      $(renderTarget).html(sum.toFixed(2));
    });
  };

  diffFromTrade = function (topCell, bottomCell, otherCell, totalCell) {
    var fullStat = +$(topCell).text();
    var tradeStat = +$(bottomCell).text();
    var playersReceived = +$(otherCell).text();
    var total = (fullStat + playersReceived) - tradeStat;

    if (total > fullStat) {
      $(totalCell).html(total).addClass('green');
    } else if (total < fullStat) {
      $(totalCell).html(total).addClass('red');
    } else {
    $(totalCell).html(total);
    };
  };

  $( "#add-to-trade" ).click(function() {
    var duration = 100;
    setTimeout(function() {
    diffFromTrade('#total-team-goals', '.total-trade-goals', '.other-total-trade-goals', '.sum-of-trade-goals');
    diffFromTrade('#total-team-assists', '.total-trade-assists', '.other-total-trade-assists', '.sum-of-trade-assists');
    diffFromTrade('#total-team-points', '.total-trade-points', '.other-total-trade-points', '.sum-of-trade-points');
    diffFromTrade('#total-team-ppp', '.total-trade-ppp', '.other-total-trade-ppp', '.sum-of-trade-ppp');
    diffFromTrade('#total-team-plusminus', '.total-trade-plusminus', '.other-total-trade-plusminus', '.sum-of-trade-plusminus');
    diffFromTrade('#total-team-pims', '.total-trade-pims', '.other-total-trade-pims', '.sum-of-trade-pims');
    diffFromTrade('#total-team-sog', '.total-trade-sog', '.other-total-trade-sog', '.sum-of-trade-sog');
    diffFromTrade('#total-team-fow', '.total-trade-fow', '.other-total-trade-fow', '.sum-of-trade-fow');
    diffFromTrade('#total-team-hits', '.total-trade-hits', '.other-total-trade-hits', '.sum-of-trade-hits');
    diffFromTrade('#total-team-blks', '.total-trade-blks', '.other-total-trade-blks', '.sum-of-trade-blks');
    diffFromTrade('#total-team-jbr', '.total-trade-jbr', '.other-total-trade-jbr', '.sum-of-trade-jbr');
    }, duration);
  });




//////////////// COMPARES PAGE //////////////////////////

  //USER SKATERS//

  //goal totals//
  totalCalc('#each-user-player','.goals','.total-goals');
  //assist totals//
  totalCalc('#each-user-player', '.assists', '.total-assists');
  //points totals//
  totalCalc('#each-user-player', '.points', '.total-points');
  //powerplay totals///
  totalCalc('#each-user-player', '.powerplay','.total-ppp');
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
    totalCalc('#each-other-player', '.powerplay','.other-total-ppp');
    //plus-minus-totals//
    totalCalc('#each-other-player', '.plusminus', '.other-total-plusminus');
    //pims total//
    totalCalc('#each-other-player', '.pims', '.other-total-pims');
    //sog totals//
    totalCalc('#each-other-player', '.sog', '.other-total-sog');
    // FOQW TOTALS ///
    totalCalc('#each-other-player', '.fow', '.other-total-fow' );
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

//// USER GOALIES TO BE TRADED /////
  $('#user-output-goalies').bind('goalieloaded', function() {
    totalCalc('#user-output-goalies', '.wins', '.total-trade-wins');
    totalCalc('#user-output-goalies', '.losses', '.total-trade-losses');
    totalCalc('#user-output-goalies', '.gaa', '.total-trade-gaa');
    totalCalc('#user-output-goalies', '.svpercent', '.total-trade-svpercent');
    totalCalc('#user-output-goalies', '.sho', '.total-trade-shutouts');
    totalCalc('#user-output-goalies', '.sv', '.total-trade-saves');
    totalCalc('#user-output-goalies', '.goalie-jbr', '.total-trade-goalie-jbr');
  });
//// OTHER PLAYERS TO BE TRADED /////////
  $('#other-output').bind('otherplayerloaded', function() {
    totalCalc('#other-output', '.goals', '.other-total-trade-goals');
    totalCalc('#other-output', '.assists', '.other-total-trade-assists');
    totalCalc('#other-output', '.points', '.other-total-trade-points');
    totalCalc('#other-output', '.ppp', '.other-total-trade-ppp');
    totalCalc('#other-output', '.plusminus', '.other-total-trade-plusminus');
    totalCalc('#other-output', '.pim', '.other-total-trade-pims');
    totalCalc('#other-output', '.sog', '.other-total-trade-sog');
    totalCalc('#other-output', '.fow', '.other-total-trade-fow');
    totalCalc('#other-output', '.hit', '.other-total-trade-hits');
    totalCalc('#other-output', '.blk', '.other-total-trade-blks');
    totalCalc('#other-output', '.jbr', '.other-total-trade-jbr');

  });
////// OTHER GOALIES TO BE TRADED STATS /////////
  $('#other-output-goalies').bind('othergoalieloaded', function() {
    totalCalc('#other-output-goalies', '.wins', '.other-total-trade-wins');
    totalCalc('#other-output-goalies', '.losses', '.other-total-trade-losses');
    totalCalc('#other-output-goalies', '.gaa', '.other-total-trade-gaa');
    totalCalc('#other-output-goalies', '.svpercent', '.other-total-trade-svpercent');
    totalCalc('#other-output-goalies', '.sho', '.other-total-trade-shutouts');
    totalCalc('#other-output-goalies', '.sv', '.other-total-trade-saves');
    totalCalc('#other-output-goalies', '.goalie-jbr', '.other-total-trade-goalie-jbr');
  });


//////////////// COMPARES PAGE //////////////////////////

});