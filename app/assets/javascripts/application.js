// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
  var message_index = 0;

  //function to show the new message form
  $("#new_message_btn" ).click(function() {
    $("#old-messages" ).hide("blind", {}, 200);
    $("#new-message" ).show("blind", {}, 400);
    $('[id^="groups-"]').removeClass("active");
    return false;
  });

  //function to show the new message form
  $("#reply_message_btn" ).click(function() {
    $("#reply_message_btn").hide();
    $("#reply-message" ).show("blind", {}, 400);
    return false;
  });

  $(".group").click(function() {
    $('[id^="groups-"]').removeClass("active");
    jQuery(this).closest("li").addClass("active");
    $("#new-message" ).hide("blind", {}, 200);
    $("#old-messages" ).show("blind", {}, 400);
    return false;
  });
});