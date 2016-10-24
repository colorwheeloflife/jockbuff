$(function () {
    var myChart = Highcharts.chart('graph-container', {
        title: {
            text: '2015 Stats',
            x: -20 //center
        },
        subtitle: {
            text: 'Source: Yahoo Fantasy Sports',
            x: -20
        },
        xAxis: {
            categories: ['G', 'A', 'P', '+/-', 'PPG', 'PPA',
                'PPP', 'SHG', 'SHA', 'SHP', 'GWG', 'GTG','SOG', 'SH%', 'FW', 'FL', 'HIT', 'BLK', 'TOTAL']
        },
        yAxis: {
            title: {
                text: 'Average Per Game'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'P.Kane',
            data: [82, 46, 60, 106, 17, 30, 37, 21, 11, 40, .216, 17, 20, 0, 0, 9, 287, .160]
        },
        {
            name: 'S.Crosby',
            data: [80, 36, 49, 85, 19, 42, 90, 35, 986, 921, .517, 10, 14, 0, 0, 9, 248, .145]
        },
        {
            name: 'A.Ovenchkin',
            data: [79, 50, 21, 71, 21, 53, 225, 34, 0, 0, .000, 19, 5, 0, 0, 8, 398, .126]
        },
        {
            name: 'D. Sedin',
            data: [82, 28, 33, 61, 7, 36, 20, 19, 5, 14, .263, 8, 11, 0, 1, 6, 258, .109]
        }]
    });
});