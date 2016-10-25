$(function () {
    $('#stacked_area').highcharts({
        chart: {
            type: 'area'
        },
        title: {
            text: 'Season Race'
        },
        xAxis: {
            categories: ['Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'June'],
            tickmarkPlacement: 'on',
            title: {
                enabled: false
            }
        },
        yAxis: {
            title: {
                text: 'Goals'
            },
        },
        tooltip: {
            split: true,
            valueSuffix: ' millions'
        },
        plotOptions: {
            area: {
                stacking: 'normal',
                lineColor: '#666666',
                lineWidth: 1,
                marker: {
                    lineWidth: 1,
                    lineColor: '#666666'
                }
            }
        },
        series: [{
            name: 'P.Kane',
            data: [7, 13, 17, 26, 33, 37, 44]
        }, {
            name: 'S.Crosby',
            data: [10, 16, 24, 27, 31, 36, 50]
        }, {
            name: 'A.Ovenchkin',
            data: [4, 12, 19, 23, 28, 33, 39]
        }, {
            name: 'D. Sedin',
            data: [6, 13, 21, 24, 28, 31, 34]
        }]
    });
});