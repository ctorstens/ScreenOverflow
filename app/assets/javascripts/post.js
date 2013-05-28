$(document).ready(function() {
  $('#new_comment').on('ajax:success', function(event, xhr, data, status){
    var comment = $(xhr);
    $('.comments').prepend(comment);
    $('#comment_comment').val('');
  });

  $('#post_video_url').on('keyup',function(e){ 
      var youtube = $(this).val(); 
      if (/http:\/\/www\.youtube\.com\/(.+)|https:\/\/www\.youtube\.com\/(.+)|http:\/\/youtu\.be\/(.+)|https:\/\/youtu\.be\/(.+)/.test(youtube)){
        var youtube = youtube.match(/(embed\/|v=|\.be\/)(.{11})/)[2];
        $.get("/youtube_url?youtube_id="+ youtube, function(data){
        $('#post_title').val(data.title);
        $('#post_content').val(data.description);
        $('#post_tag_list').val(data.tag);
      });
    };
  });
});
