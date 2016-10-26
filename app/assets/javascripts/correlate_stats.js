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

  $(function () {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawLineChart(data);
        }
    });
  });

  $(function () {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawLineChart_top(data);
        }
    });
  });

  $(function () {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawNegColChart(data);
        }
    });
  });

  $(function () {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawNegColChart_top(data);
        }
    });
  });

  $(function () {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawRankColChart(data);
        }
    });
  });

  $(function () {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawRankColChart_top(data);
        }
    });
  });

  $(function () {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawSpiderChart(data);
        }
    });
  });

  $(function () {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawSpiderChart_top(data);
        }
    });
  });


// click options

  $("#button").click(function() {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawLineChart(data);
        }
    });
  });

  $("#button").click(function() {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawLineChart_top(data);
        }
    });
  });

  $("#button").click(function() {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawNegColChart(data);
        }
    });
  });

  $("#button").click(function() {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawNegColChart_top(data);
        }
    });
  });

  $("#button").click(function() {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawRankColChart(data);
        }
    });
  });

  $("#button").click(function() {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawRankColChart_top(data);
        }
    });
  });

  $("#button").click(function() {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawSpiderChart(data);
        }
    });
  });

  $("#button").click(function() {
    $.ajax({
        url: "URL",
        method: "GET",
        data: {DATA},
        success: function (data) {
            drawSpiderChart_top(data);
        }
    });
  });







}); /* end up function */