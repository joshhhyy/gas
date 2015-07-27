// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require highlight_js/highlight
//= require highlight_js/languages/ruby
//= require jquery-readyselector
//= require bootstrap-wysihtml5
//= require bootstrap-sprockets
//= require bootstrap-select
//= require_tree .






// Syntax highlighter function call

hljs.initHighlightingOnLoad();

$(document).ready(function() {

//Hide quotes display and new quote input on doc ready (because who needs backbone?)
  $('.quoteBox').hide();

// Script for generating rich text toolbar (can be used anywhere)
  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5({
      toolbar: {
        "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
        "emphasis": true, //Italics, bold, etc. Default true
        "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
        "link": false, //Button to insert a link. Default true
        "image": false, //Button to insert an image. Default true,
        "color": true, //Button to change color of font  
        "blockquote": false, //Blockquote  
        "size": "none"
      }
    });
  });

// Code for tag cloud (WIP)
  $(".groups.show").ready(function() {
    // console.log(gon.allTags);

  })

// Code for showing quotes and quote input overlay
  $(".groups.show").ready(function() {

    $('.showQuotes').on('click', function(event) {
      $('.quoteBox').fadeIn(200, function() {
      });

    $('.closeMe').on('click', function(event) {
      $('.quoteBox').fadeOut(200, function() {
      });
    })

  })

    
  })

// Script for parsing post content 
  $(".posts.show").ready(function() {

    var parseTextShow = function() {
      var parseMe = $(".parseMe");
      stringToParse = gon.postContent;
      html = $.parseHTML(stringToParse);
      $('.parseMe').append(html);
    }
    parseTextShow();
  });

  // $(".users.show").ready(function() {
  //   $('#submit').on('click', function(e) {
  //     var message = $('#field').val();
  //     console.log(message)

  //   })
  // })



})

