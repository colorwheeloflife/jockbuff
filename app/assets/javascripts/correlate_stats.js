// $(function () {
//     var pp = gon.player_passports;
//     // alert(gon.player_passports.length);
//     alert(gon.player_passports.first);

//     // for (var i; i < pp.length; i++) {

//     //     if (i.id == 5777) {
//     //            alert(i.id);
//     //         }

//     //     else {
//     //         alert('nope');
//     //     }


//         // hasValue(prop, id, 5777)

//         // function hasValue(obj, id, value) {
//         //     return obj.hasOwnProperty(id) && obj[id] === value;
//         // }

//     // }

//   });

$(function () {
    $('table.table tr td.player_name').draggable();

    $('.dropspace').droppable({
        drop: function (event, ui) {
            selectedPlayer1 = (ui.draggable.attr('id'));
            // selectedPlayer1 = (ui.draggable).data;
            alert(selectedPlayer1);

            // more magic goes here
            // $.ajax({
            //     url: "/players/",
            //     method: "GET",
            //     data: {DATA},
            //     success: function (data) {
            //         drawSpiderChart_top(data);
            //     }
            // });
        }
    })

  });


$(function () {
    $('#draggable li').draggable();

    $("#droppable").droppable({
        drop: function (event, ui) {

            alert(ui.draggable.attr('id'));
        }

    });

});

// $(function () {
//     $('#draggable li').draggable();

//     // $('#player-droppable_1').droppable({
//     //     drop: function (event, ui) {
//     //         selectedPlayer1 = (ui.draggable.attr('id'));
//     //         puts selectedPlayer1
//     //         // more magic goes here
//     //         $.ajax({
//     //             url: "URL",
//     //             method: "GET",
//     //             data: {DATA},
//     //             success: function (data) {
//     //                 drawSpiderChart_top(data);
//     //             }
//     //         });
//     //     }
//     // })
//   });












$(function () {

/* ------ Defining jQuery selector variables ------ */




/* ------ AJAX functions ------ */

  $("#button").click(function() {
    $.ajax({
        url: "URL",
        type: "POST",
        data: {DATA},
        success: function (data) {
            // append data to your page
            $("PAGE ELEMENT").html(data);
        }
    });
  });


// on load

//   $(function () {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawLineChart(data);
//         }
//     });
//   });

//   $(function () {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawLineChart_top(data);
//         }
//     });
//   });

//   $(function () {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawNegColChart(data);
//         }
//     });
//   });

//   $(function () {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawNegColChart_top(data);
//         }
//     });
//   });

//   $(function () {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawRankColChart(data);
//         }
//     });
//   });

//   $(function () {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawRankColChart_top(data);
//         }
//     });
//   });

//   $(function () {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawSpiderChart(data);
//         }
//     });
//   });

//   $(function () {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawSpiderChart_top(data);
//         }
//     });
//   });



// // drag n drop option — - -



//   $(function () {
//     $('#player-draggable').draggable();

//     $('#player-droppable_2').droppable({
//         drop: function (event, ui) {
//             selectedPlayer2 = (ui.draggable.attr('id'));

//             // more magic goes here
//             $.ajax({
//                 url: "URL",
//                 method: "GET",
//                 data: {DATA},
//                 success: function (data) {
//                     drawSpiderChart_top(data);
//                 }
//             });
//         }
//     })
//   });



// // click options — — — .select()

//   $("#button").click(function() {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawLineChart(data);
//         }
//     });
//   });

//   $("#button").click(function() {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawLineChart_top(data);
//         }
//     });
//   });

//   $("#button").click(function() {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawNegColChart(data);
//         }
//     });
//   });

//   $("#button").click(function() {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawNegColChart_top(data);
//         }
//     });
//   });

//   $("#button").click(function() {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawRankColChart(data);
//         }
//     });
//   });

//   $("#button").click(function() {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawRankColChart_top(data);
//         }
//     });
//   });

//   $("#button").click(function() {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawSpiderChart(data);
//         }
//     });
//   });

//   $("#button").click(function() {
//     $.ajax({
//         url: "URL",
//         method: "GET",
//         data: {DATA},
//         success: function (data) {
//             drawSpiderChart_top(data);
//         }
//     });
//   });







}); /* end up function */