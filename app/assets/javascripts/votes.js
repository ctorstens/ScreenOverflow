$(document).ready(function() {
  postUpVoteSuccess();
  postDownVoteSuccess();
  commentUpVoteSuccess();
  commentDownVoteSuccess();


});


var postUpVoteSuccess = function() {
  $(".post form#vote_up_post_form").on('ajax:success', function(event, data){
    console.log("postup");
    console.log(data.vote_total);
    $(".post_vote_score").text(data.vote_total)
  });
};

var postDownVoteSuccess = function() {
  $(".post form#vote_down_post_form").on('ajax:success', function(event, data){
    console.log("postdown");
    console.log(data.vote_total);
    $(".post_vote_score").text(data.vote_total)
  });
};

var commentUpVoteSuccess = function() {
  $(".comment form.vote_up_comment_form").on('ajax:success', function(event, data){
    console.log("commentup");
    console.log(data.vote_total);
    $(this).parent().find("span.vote_score").text(data.vote_total)
  });
};

var commentDownVoteSuccess = function() {
  $(".comment form.vote_down_comment_form").on('ajax:success', function(event, data){
    console.log("commentdown");
    console.log(data.vote_total);
    $(this).parent().find("span.vote_score").text(data.vote_total)
  });
};





