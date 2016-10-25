// Basic Column √
// Column with Negative Values √
// Basic Line √
// Spider Web √

//READY FOR DATA

$(function () {
    var myLineGraph = Highcharts.chart('line_graph-container', {
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
                text: 'Season Total'
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


//READY FOR DATA
$(function () {
    var column_with_neg = Highcharts.chart('colume_neg-container', {
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
            categories: ['John', 'Jane', 'Joe', 'Jane', 'Jeffrey', 'Jack', 'James', 'Joseph']
        },
        credits: {
            enabled: false
        },
        series: [{
            name: 'John',
            data: [-1062.5]
        }, {
            name: 'Jane',
            data: [1937.5]
        }, {
            name: 'Joe',
            data: [437.5]
        }, {
            name: 'Jane',
            data: [-2062.5]
        }, {
            name: 'Jeffrey',
            data: [937.5]
        }, {
            name: 'Jack',
            data: [-1062.5]
        }, {
            name: 'James',
            data: [3937.5]
        }, {
            name: 'Joseph',
            data: [-3062.5]
        },
        ]
    });
});



// //
// $(function () {
//     var stacked_area = Highcharts.chart('stacked_area-container', {
//         chart: {
//             type: 'area'
//         },
//         title: {
//             text: 'Season Race'
//         },
//         xAxis: {
//             categories: ['Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'June'],
//             tickmarkPlacement: 'on',
//             title: {
//                 enabled: false
//             }
//         },
//         yAxis: {
//             title: {
//                 text: 'Goals'
//             },
//         },
//         tooltip: {
//             split: true,
//             valueSuffix: ' millions'
//         },
//         plotOptions: {
//             area: {
//                 stacking: 'normal',
//                 lineColor: '#666666',
//                 lineWidth: 1,
//                 marker: {
//                     lineWidth: 1,
//                     lineColor: '#666666'
//                 }
//             }
//         },
//         series: [{
//             name: 'P.Kane',
//             data: [7, 13, 17, 26, 33, 37, 44]
//         }, {
//             name: 'S.Crosby',
//             data: [10, 16, 24, 27, 31, 36, 50]
//         }, {
//             name: 'A.Ovenchkin',
//             data: [4, 12, 19, 23, 28, 33, 39]
//         }, {
//             name: 'D. Sedin',
//             data: [6, 13, 21, 24, 28, 31, 34]
//         }]
//     });
// });



//READY FOR DATA




//READY FOR DATA
$(function () {

    var mySpiderChart = Highcharts.chart('spider_graph-container', {

        chart: {
            polar: true,
            type: 'line'
        },

        title: {
            text: 'Profile Outlook',
            x: -80
        },

        pane: {
            size: '80%'
        },

        xAxis: {
            categories: ['Goals', 'Assists', '+/-', 'Penalty Minutes',
                    'Power-Play Points', 'Shots on Goal'],
            tickmarkPlacement: 'on',
            lineWidth: 0
        },

        yAxis: {
            gridLineInterpolation: 'polygon',
            lineWidth: 0,
            min: 0
        },

        tooltip: {
            shared: true,
            pointFormat: '<span style="color:{series.color}">{series.name}: <b>${point.y:,.0f}</b><br/>'
        },

        legend: {
            align: 'right',
            verticalAlign: 'top',
            y: 70,
            layout: 'vertical'
        },

        series: [{
            name: 'Jock #1',
            data: [43000, 19000, 60000, 35000, 17000, 10000],
            pointPlacement: 'on'
        }, {
            name: 'Jock #2',
            data: [50000, 39000, 42000, 31000, 26000, 14000],
            pointPlacement: 'on'
        },
        {
            name: 'Jock #3',
            data: [50000, 39000, 42000, 31000, 26000, 14000],
            pointPlacement: 'on'
        }]

    });
});

$(function () {
    var column_with_neg = Highcharts.chart('rank_colume-container', {
        chart: {
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                depth: 50,
                viewDistance: 25
            }
        },
        title: {
            text: 'Category Leaderboard'
        },
        subtitle: {
            text: 'Category: Total Overall'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        xAxis: {
            categories: ['Mark', 'Jacob', 'Larry', 'Bob', 'Derek', 'Chris', 'Daniel', 'Sarah', 'Taylor', 'Mitch', 'Alex', 'Devin']
        },
        series: [{
            data: [1000, 900, 900, 800, 700, 600, 600, 500, 400, 300, 200, 100]
        }]
    });
});