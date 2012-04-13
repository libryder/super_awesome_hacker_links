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
//= require twitter/bootstrap
//= require_tree .
//
$(document).ready(function() {
  $('#error, #notice').fadeIn().delay(1200).fadeOut(1000);

  $('.vote_link').click(function() {
    prnt = $(this);

    link_id = $(this).attr('rel');
    $.post('/votes', {link_id: link_id }, function(data) {
      // Change DOM to reflect new votes
//alert(data.new_count);
      if (data.has_voted) {
        alert("You have already +1'd this link!");
      }
      else {
        prnt.parent().parent().find('.vote_count').html('+'+data.new_count)
        prnt.removeClass('has_not_voted');
//prnt.addClass('btn btn-mini');
      }
    });
  });

  return false;

});

