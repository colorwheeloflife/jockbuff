$(function() {
  if (window.location.pathname == "/users/" + PageData.user_id + "/leagues/" + PageData.league_id + "/teams/" + PageData.team_id + "/players") {
    var topLeaguePlayerData = getTopPlayerStats();
    var categories = getLeagueCats();
    var topPlayerName = getTopPlayerName() + " (top JBR player)";
    cleanerCategories = [];
    cleanestCategories = [];
    var g = "";
    var a = "";
    var p = "";
    var ppg = "";
    var ppa = "";
    var ppp = "";
    var plusminus = "";
    var shg = "";
    var sha = "";
    var shp = "";
    var gwg= "";
    var gtg = "";
    var pim = "";
    var sog = "";
    var shpercent = "";
    var fw = "";
    var fl = "";
    var hit = "";
    var blk = "";
    for (var i = 0; i < categories.length; i++) {
      if (categories[i] !== "") {
        switch (categories[i]) {
        case "g":
          var g = "g";
          break;
        case "a":
          var a = "a";
          break;
        case "p":
          var p = "p";
          break;
        case "ppg":
          var ppg = "ppg";
          break;
        case "ppa":
          var ppa = "ppa";
          break;
        case "ppp":
          var ppp = "ppp";
          break;
        case "plusminus":
          var plusminus = "plusminus";
          break;
        case "shg":
          var shg = "shg";
          break;
        case "sha":
          var sha = "sha";
          break;
        case "shp":
          var shp = "shp";
          break;
        case "gwg":
          var gwg = "gwg";
          break;
        case "gtg":
          var gtg = "gtg";
          break;
        case "pim":
          var pim = "pim";
          break;
        case "sog":
          var sog = "sog";
          break;
        case "shpercent":
          var shperent = "shpercent";
          break;
        case "fw":
          var fw = "fw";
          break;
        case "fl":
          var fl = "fl";
          break;
        case "hit":
          var hit = "hit";
          break;
        case "blk":
          var blk = "blk";
          break;
        default:
          break;
      }
      }
    }
    cleanerCategories.push(g);
    cleanerCategories.push(a);
    cleanerCategories.push(p);
    cleanerCategories.push(ppg);
    cleanerCategories.push(ppa);
    cleanerCategories.push(ppp);
    cleanerCategories.push(plusminus);
    cleanerCategories.push(shg);
    cleanerCategories.push(sha);
    cleanerCategories.push(shp);
    cleanerCategories.push(gwg);
    cleanerCategories.push(gtg);
    cleanerCategories.push(pim);
    cleanerCategories.push(sog);
    cleanerCategories.push(shpercent);
    cleanerCategories.push(fw);
    cleanerCategories.push(fl);
    cleanerCategories.push(hit);
    cleanerCategories.push(blk);
    for (var i = 0; i < cleanerCategories.length; i++) {
      if (cleanerCategories[i] !== "") {
        cleanestCategories.push(cleanerCategories[i]);
      }
    }
    var graph_data = [{
        name: topPlayerName,
        data: topLeaguePlayerData
      }];
    var graph_categories = cleanestCategories;
    var graph_colors = ["#000000", "#23395B", "#008DD5", "#8EB1C7", "#5AFF15", "#FFBC42", "#EB4511", "#F45866", "#EE0000", "#9932CD"];
    function colorer (array) {
      var index = Math.random(0, array.length);
      return array[index];
    }
    $("#add_player").click(function() {
      $("#selection-output").empty();
      var selectedPlayers = $('#playersTable').bootstrapTable('getSelections');
      $.each(selectedPlayers, function(index, value) {
        var row = $('<tr>');
        $('#selection-output').append(row);
        row.addClass(value.id);
        row.append($('<td>').text(value.name));
        row.append($('<td>').text(value.pro_team));
        row.append($('<td>').text(value.positions));
        row.append($('<td>').text(value.jbr));
        if (value.g !== undefined) { row.append($('<td>').text(value.g)); }
        if (value.a !== undefined) { row.append($('<td>').text(value.a)); }
        if (value.p !== undefined) { row.append($('<td>').text(value.p)); }
        if (value.ppg !== undefined) { row.append($('<td>').text(value.ppg)); }
        if (value.ppa !== undefined) { row.append($('<td>').text(value.ppa)); }
        if (value.ppp !== undefined) { row.append($('<td>').text(value.ppp)); }
        if (value.plusminus !== undefined) { row.append($('<td>').text(value.plusminus)); }
        if (value.shg !== undefined) { row.append($('<td>').text(value.shg)); }
        if (value.sha !== undefined) { row.append($('<td>').text(value.sha)); }
        if (value.shp !== undefined) { row.append($('<td>').text(value.shp)); }
        if (value.gwg !== undefined) { row.append($('<td>').text(value.gwg)); }
        if (value.gtg !== undefined) { row.append($('<td>').text(value.gtg)); }
        if (value.pim !== undefined) { row.append($('<td>').text(value.pim)); }
        if (value.sog !== undefined) { row.append($('<td>').text(value.sog)); }
        if (value.shpercent !== undefined) { row.append($('<td>').text(value.shpercent)); }
        if (value.fw !== undefined) { row.append($('<td>').text(value.fw)); }
        if (value.fl !== undefined) { row.append($('<td>').text(value.fl)); }
        if (value.hit !== undefined) { row.append($('<td>').text(value.hit)); }
        if (value.blk !== undefined) { row.append($('<td>').text(value.blk)); }
      });
      graph_data = [];
      $.each(selectedPlayers, function(index, value) {
        var data = [];
        var player_data = {
          name: value.name,
          data: data
        };
        if (value.g !== undefined) { data.push(parseInt(value.g)); }
        if (value.a !== undefined) { data.push(parseInt(value.a)); }
        if (value.p !== undefined) { data.push(parseInt(value.p)); }
        if (value.ppg !== undefined) { data.push(parseInt(value.ppg)); }
        if (value.ppa !== undefined) { data.push(parseInt(value.ppa)); }
        if (value.ppp !== undefined) { data.push(parseInt(value.ppp)); }
        if (value.plusminus !== undefined) { data.push(parseInt(value.plusminus)); }
        if (value.shg !== undefined) { data.push(parseInt(value.shg)); }
        if (value.sha !== undefined) { data.push(parseInt(value.sha)); }
        if (value.shp !== undefined) { data.push(parseInt(value.shp)); }
        if (value.gwg !== undefined) { data.push(parseInt(value.gwg)); }
        if (value.gtg !== undefined) { data.push(parseInt(value.gtg)); }
        if (value.pim !== undefined) { data.push(parseInt(value.pim)); }
        if (value.sog !== undefined) { data.push(parseInt(value.sog)); }
        if (value.shpercent !== undefined) { data.push(parseInt(value.shpercent)); }
        if (value.fw !== undefined) { data.push(parseInt(value.fw)); }
        if (value.fl !== undefined) { data.push(parseInt(value.fl)); }
        if (value.hit !== undefined) { data.push(parseInt(value.hit)); }
        if (value.blk !== undefined) { data.push(parseInt(value.blk)); }
        graph_data.push(player_data);
      });
      linegraph();
    });
    $('#line_graph-top').highcharts({
        title: {
          text: 'Player Stats',
          x: -20 //center
        },
        subtitle: {
          text: 'Source: Yahoo Fantasy Sports',
          x: -20
        },
        xAxis: {
          categories: graph_categories
        },
        yAxis: {
          title: {
              text: 'Season Total'
          },
          plotLines: [{
              value: 0,
              width: 1,
              color: "#000000"
          }]
        },
        legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle',
          borderWidth: 0
        },
        series: graph_data
        }
      );
    function linegraph () {
      $('#line_graph-top').highcharts({
        title: {
          text: 'Player Stats',
          x: -20 //center
        },
        subtitle: {
          text: 'Source: Yahoo Fantasy Sports',
          x: -20
        },
        xAxis: {
          categories: graph_categories
        },
        yAxis: {
          title: {
              text: 'Season Total'
          },
          plotLines: [{
              value: 0,
              width: 1,
              color: "#000000"
          }]
        },
        legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle',
          borderWidth: 0
        },
        series: graph_data
      });
    }
  }
});
>>>>>>> 95dc1ea9884daa91a36a0ed75b6a5fe3f7a2ac35
