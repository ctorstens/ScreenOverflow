$(document).ready(function() {
  postUpVoteSuccess();
  postDownVoteSuccess();
  commentUpVoteSuccess();
  commentDownVoteSuccess();


});


var postUpVoteSuccess = function() {
  $(".post form#vote_up_post_form").on('ajax:success', function(event, data){
    $(".post_vote_score").text(data.vote_total)
  });
};

var postDownVoteSuccess = function() {
  $(".post form#vote_down_post_form").on('ajax:success', function(event, data){
    $(".post_vote_score").text(data.vote_total)
  });
};

var commentUpVoteSuccess = function() {
  $(".comment form.vote_up_comment_form").on('ajax:success', function(event, data){
    $(this).parent().find("span.vote_score").text(data.vote_total)
  });
};

var commentDownVoteSuccess = function() {
  $(".comment form.vote_down_comment_form").on('ajax:success', function(event, data){
    $(this).parent().find("span.vote_score").text(data.vote_total)
  });
};





