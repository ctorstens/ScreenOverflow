$(document).ready(function () {
  $('#new_youtube_text').hide();
  $('#header_button_add_post').on('click', function (e) {
    e.preventDefault();
    $('#new_youtube_text').animate({width: 'toggle'});
  });
});