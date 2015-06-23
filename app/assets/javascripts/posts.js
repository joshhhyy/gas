console.log("Yes");

$(".posts.show").ready(function() {

  console.log("Ready")

  var parseText = function() {
  var parseMe = $(".parseMe");
  stringToParse = gon.postContent;
  html = $.parseHTML(stringToParse)
  console.log(html)

  $('.parseMe').append( html );

  };

  parseText();
}