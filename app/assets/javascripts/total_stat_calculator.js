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
      var sum = 0;
      var count = 0;
      $(this).find(statsTarget).each(function() {
          sum += +$(this).text() || 0;
          count ++;
      });
      $(renderTarget).html((sum/count).toFixed(2));
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

    percentageDiffFromTrade = function (topCell, bottomCell, otherCell, totalCell) {
    var fullStat = +$(topCell).text();
    var tradeStat = +$(bottomCell).text();
    var playersReceived = +$(otherCell).text();
    var total = (fullStat + playersReceived) - tradeStat;

    if (total > fullStat) {
      $(totalCell).html(total.toFixed(2)).addClass('green');
    } else if (total < fullStat) {
      $(totalCell).html(total.toFixed(2)).addClass('red');
    } else {
    $(totalCell).html(total.toFixed(2));
    };
  };

  var graphCategories = [];
  var graphData = [];

  $( "#add-to-trade" ).click(function() {
    var duration = 100;
    setTimeout(function() {
      //// USER TEAM PLAYER STATS
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
    //// OTHER TEAM PLAYER STATS
    diffFromTrade('#other-total-team-goals', '.other-total-trade-goals', '.total-trade-goals', '.other-sum-of-trade-goals');
    diffFromTrade('#other-total-team-assists', '.other-total-trade-assists', '.total-trade-assists', '.other-sum-of-trade-assists');
    diffFromTrade('#other-total-team-points', '.other-total-trade-points', '.total-trade-points', '.other-sum-of-trade-points');
    diffFromTrade('#other-total-team-ppp', '.other-total-trade-ppp', '.total-trade-ppp', '.other-sum-of-trade-ppp');
    diffFromTrade('#other-total-team-plusminus', '.other-total-trade-plusminus', '.total-trade-plusminus', '.other-sum-of-trade-plusminus');
    diffFromTrade('#other-total-team-pims', '.other-total-trade-pims', '.total-trade-pims', '.other-sum-of-trade-pims');
    diffFromTrade('#other-total-team-sog', '.other-total-trade-sog', '.total-trade-sog', '.other-sum-of-trade-sog');
    diffFromTrade('#other-total-team-fow', '.other-total-trade-fow', '.total-trade-fow', '.other-sum-of-trade-fow');
    diffFromTrade('#other-total-team-hits', '.other-total-trade-hits', '.total-trade-hits', '.other-sum-of-trade-hits');
    diffFromTrade('#other-total-team-blks', '.other-total-trade-blks', '.total-trade-blks', '.other-sum-of-trade-blks');
    diffFromTrade('#other-total-team-jbr', '.other-total-trade-jbr', '.total-trade-jbr', '.other-sum-of-trade-jbr');

    /// USER TEAM GOALIE STATS
    diffFromTrade('#total-team-wins', '.total-trade-wins', '.other-total-trade-wins', '.sum-of-trade-wins');
    diffFromTrade('#total-team-losses', '.total-trade-losses', '.other-total-trade-losses', '.sum-of-trade-losses');
    percentageDiffFromTrade('#total-team-gaa', '.total-trade-gaa', '.other-total-trade-gaa', '.sum-of-trade-gaa');
    percentageDiffFromTrade('#total-team-svpercent', '.total-trade-svpercent', '.other-total-trade-svpercent', '.sum-of-trade-svpercent');
    diffFromTrade('#total-team-shutouts', '.total-trade-shutouts', '.other-total-trade-shutouts', '.sum-of-trade-shutouts');
    diffFromTrade('#total-team-saves', '.total-trade-saves', '.other-total-trade-saves', '.sum-of-trade-saves');
    diffFromTrade('#total-team-goalie-jbr', '.total-trade-goalie-jbr', '.other-total-trade-goalie-jbr', '.sum-of-trade-goalie-jbr');
    /// OTHER TEAM GOALIE SATS
    diffFromTrade('#other-total-team-wins', '.other-total-trade-wins', '.total-trade-wins', '.other-sum-of-trade-wins');
    diffFromTrade('#other-total-team-losses', '.other-total-trade-losses', '.total-trade-losses', '.other-sum-of-trade-losses');
    percentageDiffFromTrade('#other-total-team-gaa', '.other-total-trade-gaa', '.total-trade-gaa', '.other-sum-of-trade-gaa');
    percentageDiffFromTrade('#other-total-team-svpercent', '.other-total-trade-svpercent', '.total-trade-svpercent', '.other-sum-of-trade-svpercent');
    diffFromTrade('#other-total-team-shutouts', '.other-total-trade-shutouts', '.total-trade-shutouts', '.other-sum-of-trade-shutouts');
    diffFromTrade('#other-total-team-saves', '.other-total-trade-saves', '.total-trade-saves', '.other-sum-of-trade-saves');
    diffFromTrade('#other-total-team-goalie-jbr', '.other-total-trade-goalie-jbr', '.total-trade-goalie-jbr', '.other-sum-of-trade-goalie-jbr');

    var userCheckedRowsSkaters = $('#userTable').bootstrapTable('getSelections');
   $.each(userCheckedRowsSkaters, function(index, value) {
    var data = [];
    var playerData = {
      data: data
    };

    var allTheKeys = Object.keys(value);
    console.log(allTheKeys);
    // console.log(typeof(allTheKeys));

    function cycle(value) {
      for (var i = 0; i < value.length; ++i) {
        if (["g", "a", "p", "ppg", "ppa", "ppp", "plusminus", "shg", "sha", "shp", "gwg", "gtg", "pim", "sog", "shpercent", "fw", "fl", "hit", "blk"].includes(allTheKeys[i])) { graphCategories.push(allTheKeys[i]); }
      }
    };
    cycle(allTheKeys);


    if (value.g !== undefined) { data.push((+$('.sum-of-trade-goals').text()) - (+$('#total-team-goals').text())); }
    if (value.a !== undefined) { data.push((+$('.sum-of-trade-assists').text()) - (+$('#total-team-assists').text()) ); }
    if (value.p !== undefined) { data.push((+$('.sum-of-trade-points').text()) - (+$('#total-team-points').text()) ); }
    if (value.ppg !== undefined) { data.push((+$('.sum-of-trade-ppg').text()) - (+$('#total-team-ppg').text()) ); }
    if (value.ppa !== undefined) { data.push((+$('.sum-of-trade-ppa').text()) - (+$('#total-team-ppa').text()) ); }
    if (value.ppp !== undefined) { data.push((+$('.sum-of-trade-ppp').text()) - (+$('#total-team-ppp').text()) ); }
    if (value.plusminus !== undefined) { data.push((+$('.sum-of-trade-plusminus').text()) - (+$('#total-team-plusminus').text()) ); }
    if (value.shg !== undefined) { data.push((+$('.sum-of-trade-shg').text()) - (+$('#total-team-shg').text()) ); }
    if (value.sha !== undefined) { data.push((+$('.sum-of-trade-sha').text()) - (+$('#total-team-sha').text()) ); }
    if (value.shp !== undefined) { data.push((+$('.sum-of-trade-shp').text()) - (+$('#total-team-shp').text()) ); }
    if (value.gwg !== undefined) { data.push((+$('.sum-of-trade-gwg').text()) - (+$('#total-team-gwg').text()) ); }
    if (value.gtg !== undefined) { data.push((+$('.sum-of-trade-gtg').text()) - (+$('#total-team-gtg').text()) ); }
    if (value.pim !== undefined) { data.push((+$('.sum-of-trade-pim').text()) - (+$('#total-team-pim').text()) ); }
    if (value.sog !== undefined) { data.push((+$('.sum-of-trade-sog').text()) - (+$('#total-team-sog').text()) ); }
    if (value.shpercent !== undefined) { data.push((+$('.sum-of-trade-shpercent').text()) - (+$('#total-team-shpercent').text()) ); }
    if (value.fw !== undefined) { data.push((+$('.sum-of-trade-fw').text()) - (+$('#total-team-fw').text()) ); }
    if (value.fl !== undefined) { data.push((+$('.sum-of-trade-fl').text()) - (+$('#total-team-fl').text()) ); }
    if (value.hit !== undefined) { data.push((+$('.sum-of-trade-hit').text()) - (+$('#total-team-hit').text()) ); }
    if (value.blk !== undefined) { data.push((+$('.sum-of-trade-blk').text()) - (+$('#total-team-blk').text()) ); }

    if (value.g !== undefined) { data.push((+$('.other-sum-of-trade-goals').text()) - (+$('#other-total-team-goals').text())); }
    if (value.a !== undefined) { data.push((+$('.other-sum-of-trade-goals-assists').text()) - (+$('#other-total-team-assists').text()) ); }
    if (value.p !== undefined) { data.push((+$('.other-sum-of-trade-goals-points').text()) - (+$('#other-total-team-points').text()) ); }
    if (value.ppg !== undefined) { data.push((+$('.other-sum-of-trade-goals-ppg').text()) - (+$('#other-total-team-ppg').text()) ); }
    if (value.ppa !== undefined) { data.push((+$('.other-sum-of-trade-goals-ppa').text()) - (+$('#other-total-team-ppa').text()) ); }
    if (value.ppp !== undefined) { data.push((+$('.other-sum-of-trade-goals-ppp').text()) - (+$('#other-total-team-ppp').text()) ); }
    if (value.plusminus !== undefined) { data.push((+$('.other-sum-of-trade-goals-plusminus').text()) - (+$('#other-total-team-plusminus').text()) ); }
    if (value.shg !== undefined) { data.push((+$('.other-sum-of-trade-goals-shg').text()) - (+$('#other-total-team-shg').text()) ); }
    if (value.sha !== undefined) { data.push((+$('.other-sum-of-trade-goals-sha').text()) - (+$('#other-total-team-sha').text()) ); }
    if (value.shp !== undefined) { data.push((+$('.other-sum-of-trade-goals-shp').text()) - (+$('#other-total-team-shp').text()) ); }
    if (value.gwg !== undefined) { data.push((+$('.other-sum-of-trade-goals-gwg').text()) - (+$('#other-total-team-gwg').text()) ); }
    if (value.gtg !== undefined) { data.push((+$('.other-sum-of-trade-goals-gtg').text()) - (+$('#other-total-team-gtg').text()) ); }
    if (value.pim !== undefined) { data.push((+$('.other-sum-of-trade-goals-pim').text()) - (+$('#other-total-team-pim').text()) ); }
    if (value.sog !== undefined) { data.push((+$('.other-sum-of-trade-goals-sog').text()) - (+$('#other-total-team-sog').text()) ); }
    if (value.shpercent !== undefined) { data.push((+$('.other-sum-of-trade-goals-shpercent').text()) - (+$('#other-total-team-shpercent').text()) ); }
    if (value.fw !== undefined) { data.push((+$('.other-sum-of-trade-goals-fw').text()) - (+$('#other-total-team-fw').text()) ); }
    if (value.fl !== undefined) { data.push((+$('.other-sum-of-trade-goals-fl').text()) - (+$('#other-total-team-fl').text()) ); }
    if (value.hit !== undefined) { data.push((+$('.other-sum-of-trade-goals-hit').text()) - (+$('#other-total-team-hit').text()) ); }
    if (value.blk !== undefined) { data.push((+$('.other-sum-of-trade-goals-blk').text()) - (+$('#other-total-team-blk').text()) ); }


    graphData.push(playerData);

  });
  negColumnGraph();
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
/* OTHER GOALIES TO BE TRADED STATS */
  $('#other-output-goalies').bind('othergoalieloaded', function() {
    totalCalc('#other-output-goalies', '.wins', '.other-total-trade-wins');
    totalCalc('#other-output-goalies', '.losses', '.other-total-trade-losses');
    totalCalc('#other-output-goalies', '.gaa', '.other-total-trade-gaa');
    totalCalc('#other-output-goalies', '.svpercent', '.other-total-trade-svpercent');
    totalCalc('#other-output-goalies', '.sho', '.other-total-trade-shutouts');
    totalCalc('#other-output-goalies', '.sv', '.other-total-trade-saves');
    totalCalc('#other-output-goalies', '.goalie-jbr', '.other-total-trade-goalie-jbr');
  });
  negColumnGraph = function () {
      $('#neg-value-column_top').highcharts({
        chart: {
          type: 'column'
        },
        title: {
          text: 'Category Leaderboard with Average as Equator'
        },
        subtitle: {
          text: 'Category: Total Overall'
        },
        xAxis: {
          categories: graphCategories
        },
        credits: {
          enabled: false
        },
        series: graphData
      });
    };

});

/* COMPARES PAGE */



