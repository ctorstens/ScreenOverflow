$(document).ready(function() {
  postUpVoteSuccess();
  postDownVoteSuccess();


});


var postUpVoteSuccess = function() {
  $(".post form#vote_up_post_form").on('ajax:success', function(event, data){
    console.log("hello")
    $(".vote_score").text(data.vote_total)
  });
};

var postDownVoteSuccess = function() {
  $(".post form#vote_down_post_form").on('ajax:success', function(event, data){
    console.log(data)
    $(".vote_score").text(data.vote_total)
  });
};






