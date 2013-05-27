$(document).ready(function() {
  $('#new_comment').on('ajax:success', function(event, xhr, data, status){
    var comment = $(xhr);
    $('.comments').prepend(comment);
    $('#comment_comment').val('');
  });
});
