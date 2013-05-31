$(document).ready(function () {

  $('#new_youtube_text').hide();
  $('#header_button_add_post').on('click', function (e) {
    e.preventDefault();
    $('#new_youtube_text').animate({width: 'toggle'}, 200);
  });

  $('#create_post_directly_form').on('submit', function (e) {
    // console.log($('#new_youtube_text'));
    e.preventDefault();
    var youtube = $('#new_youtube_text').val();
    if (/http:\/\/www\.youtube\.com\/(.+)|https:\/\/www\.youtube\.com\/(.+)|http:\/\/youtu\.be\/(.+)|https:\/\/youtu\.be\/(.+)/.test(youtube)){
      // console.log('test');
      var youtube = youtube.match(/(embed\/|v=|\.be\/)(.{11})/)[2];
      $('#new_youtube_text').val('');
      $.get("/youtube_url?youtube_id="+ youtube, function(data){
        $title = data.title;
        $content = data.description;
        $tag_list = data.tag;

        $.post('/posts/create', {title: $title, content: $content, tag_list: $tag_list}).done(function (data) {
          console.log('done')
          console.log(data.status)
          window.location = data.url;
          // console.log(data.status);
          // alert(data.status);
        });
      });
    }
  });

});











// NOTES


// $('#post_video_url').on('keyup',function(e){ 
//       var youtube = $(this).val(); 
//       if (/http:\/\/www\.youtube\.com\/(.+)|https:\/\/www\.youtube\.com\/(.+)|http:\/\/youtu\.be\/(.+)|https:\/\/youtu\.be\/(.+)/.test(youtube)){
//         var youtube = youtube.match(/(embed\/|v=|\.be\/)(.{11})/)[2];
//         $.get("/youtube_url?youtube_id="+ youtube, function(data){
//         $('#post_title').val(data.title);
//         $('#post_content').val(data.description);
//         $('#post_tag_list').val(data.tag);
//       });
//     };
//   });