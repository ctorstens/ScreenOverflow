$(document).ready(function() {
  $('#new_comment').on('ajax:success', function(event, xhr, data, status){
    console.log("callback");
    var comment = $(xhr);
    console.log(comment);
    $('.comments').prepend(comment);
  });
});
