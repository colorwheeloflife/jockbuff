
  totalCalc = function (tableTarget, statsTarget, renderTarget) {
      $(tableTarget).each(function () {
        var sum = 0
        $(this).find(statsTarget).each(function () {
            sum += +$(this).text() || 0;
        });
        $(renderTarget).html(sum);
      });
    };




  /* USER SKATERS */

  /* goal totals */
  totalCalc('#each-user-player','.goals','.total-goals');
  /* assist totals */
  totalCalc('#each-user-player', '.assists', '.total-assists');
  /* points totals */
  totalCalc('#each-user-player', '.points', '.total-points');
  /* powerplay-goals totals */
  totalCalc('#each-user-player', '.powerplay-goal','.total-powerplay-goal');
  /* powerplay-assists totals */
  totalCalc('#each-user-player', '.powerplay-assist','.total-powerplay-assist');
  /* powerplay-points totals */
  totalCalc('#each-user-player', '.powerplay-points','.total-powerplay-points');
  /* short-handed-goals-total */
  totalCalc('#each-user-player', '.shg', '.total-shg');
  /* short-handed-assists-total */
  totalCalc('#each-user-player', '.sha', '.total-sha');
  /* short-handed-points-total */
  totalCalc('#each-user-player', '.shp', '.total-shp');
  /* gwg */
  totalCalc('#each-user-player', '.gwg', '.total-gwg');
  /* gtg */
  totalCalc('#each-user-player', '.gtg', '.total-gtg');
  /* plus-minus-totals */
  totalCalc('#each-user-player', '.plusminus', '.total-plusminus');
  /* pims total */
  totalCalc('#each-user-player', '.pims', '.total-pims');
  /* sog totals */
  totalCalc('#each-user-player', '.sog', '.total-sog');
  /* shpercent totals */
  totalCalc('#each-user-player', '.shpercent', '.total-shpercent');
  /* fw total */
  totalCalc('#each-user-player', '.fw', '.total-fw');
  /* fl total */
  totalCalc('#each-user-player', '.fl', '.total-fl');
  /* hits total */
  totalCalc('#each-user-player', '.hit', '.total-hits');
  /* blks total */
  totalCalc('#each-user-player', '.blk', '.total-blks' );
  /* JBR total */
  totalCalc('#each-user-player', '.jbr-stat', '.total-jbr');



  /* USER GOALIES */

  // /* Goalie wins total */
  // totalCalc('#each-user-goalie', '.wins', '.total-wins');
  // /* Goalie JBR total */
  // totalCalc('#each-user-goalie', '.losses', '.total-losses');
  // /* Goalie JBR total */
  // totalCalc('#each-user-goalie', '.gaa', '.total-gaa');
  // /* Goalie JBR total */
  // totalCalc('#each-user-goalie', '.ga', '.total-ga');
  //  Goalie JBR total
  // totalCalc('#each-user-goalie', '.svpercent', '.total-svpercent');
  // /* Goalie JBR total */
  // totalCalc('#each-user-goalie', '.saves', '.total-saves');
  // /* Goalie JBR total */
  // totalCalc('#each-user-goalie', '.shutouts', '.total-shutouts');
  // /* Goalie JBR total */
  // totalCalc('#each-user-goalie', '.goalie-jbr-stat', '.total-goalie-jbr');



  /* OTHER SKATERS */

  /* goal totals */
  totalCalc('#each-other-player','.goals','.total-goals');
  /* assist totals */
  totalCalc('#each-other-player', '.assists', '.total-assists');
  /* points totals */
  totalCalc('#each-other-player', '.points', '.total-points');
  /* powerplay-goals totals */
  totalCalc('#each-other-player', '.powerplay-goal','.total-powerplay-goal');
  /* powerplay-assists totals */
  totalCalc('#each-other-player', '.powerplay-assist','.total-powerplay-assist');
  /* powerplay-points totals */
  totalCalc('#each-other-player', '.powerplay-points','.total-powerplay-points');
  /* short-handed-goals-total */
  totalCalc('#each-other-player', '.shg', '.total-shg');
  /* short-handed-assists-total */
  totalCalc('#each-other-player', '.sha', '.total-sha');
  /* short-handed-points-total */
  totalCalc('#each-other-player', '.shp', '.total-shp');
  /* gwg */
  totalCalc('#each-other-player', '.gwg', '.total-gwg');
  /* gtg */
  totalCalc('#each-other-player', '.gtg', '.total-gtg');
  /* plus-minus-totals */
  totalCalc('#each-other-player', '.plusminus', '.total-plusminus');
  /* pims total */
  totalCalc('#each-other-player', '.pims', '.total-pims');
  /* sog totals */
  totalCalc('#each-other-player', '.sog', '.total-sog');
  /* shpercent totals */
  totalCalc('#each-other-player', '.shpercent', '.total-shpercent');
  /* fw total */
  totalCalc('#each-other-player', '.fw', '.total-fw');
  /* fl total */
  totalCalc('#each-other-player', '.fl', '.total-fl');
  /* hits total */
  totalCalc('#each-other-player', '.hit', '.total-hits');
  /* blks total */
  totalCalc('#each-other-player', '.blk', '.total-blks' );
  /* JBR total */
  totalCalc('#each-other-player', '.jbr-stat', '.total-jbr');




  /* OTHER GOALIES */

  // /* Goalie wins total */
  // totalCalc('#each-other-goalie', '.wins', '.total-wins');
  // /* Goalie JBR total */
  // totalCalc('#each-other-goalie', '.losses', '.total-losses');
  // /* Goalie JBR total */
  // totalCalc('#each-other-goalie', '.gaa', '.total-gaa');
  // /* Goalie JBR total */
  // totalCalc('#each-other-goalie', '.ga', '.total-ga');
  //  Goalie JBR total
  // totalCalc('#each-other-goalie', '.svpercent', '.total-svpercent');
  // /* Goalie JBR total */
  // totalCalc('#each-other-goalie', '.saves', '.total-saves');
  // /* Goalie JBR total */
  // totalCalc('#each-other-goalie', '.shutouts', '.total-shutouts');
  // /* Goalie JBR total */
  // totalCalc('#each-other-goalie', '.goalie-jbr-stat', '.total-goalie-jbr');






