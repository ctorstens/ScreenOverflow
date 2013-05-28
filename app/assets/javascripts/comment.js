$(document).ready(function() {
  $('#new_comment').on('ajax:success', function(xhr, data, status){
    console.log(data)
    var comment = $(data);
    $('.comments').prepend(comment);
    $('#comment_comment').val('');
    commentUpVoteSuccess();
    commentDownVoteSuccess();

  });
});
