$(function () {

    $('#spider_graph').highcharts({

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