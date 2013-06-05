$(document).ready(function() {

  $('#post_video_url').on('keyup',function(e){
      var youtube = $(this).val();
      if (/http:\/\/www\.youtube\.com\/(.+)|https:\/\/www\.youtube\.com\/(.+)|http:\/\/youtu\.be\/(.+)|https:\/\/youtu\.be\/(.+)/.test(youtube)){
        var youtube = youtube.match(/(embed\/|v=|\.be\/)(.{11})/)[2];
        $.get("/youtube_url?youtube_id="+ youtube, function(data){
        $('#post_title').val(data.title);
        $('#post_content').val(data.description);
        $('#post_tag_list').val(data.tag);
        $('.youtube-preview').css('display','none');
        $('.youtube-preview').html('<iframe allowfullscreen="" frameborder="0" height="239" src="http://www.youtube.com/embed/'+ data.preview +'?html5=1&amp;vq=hd720" width="425"></iframe>');

$('.youtube-preview').fadeIn('slow');

      });
    };
  });


  var $container = $('#iso_content');

  $container.isotope({
    filter: '*',
    animationOptions: {
      duration: 750,
      easing: 'linear',
      queue: false,
    }
  });

  $('.tag_section a').click(function(){
    var selector = $(this).attr('data-filter');
    $container.isotope({
      filter: selector,
      animationOptions: {
        duration: 750,
        easing: 'linear',
        queue: false,
      }
    });
    return false;
  });

  $('.isotope-item').css('cursor', 'pointer');

  $('.isotope-item').hover(function(e) {
      $(this).addClass("hover_me");
    }, function(){
      $(this).removeClass("hover_me");
  });

  $('.isotope-item').on('click', function(e) {
      console.log(this.childNodes[1].childNodes[1].attributes[0].nodeValue);
      var the_link = this.childNodes[1].childNodes[1].attributes[0].nodeValue;
      window.location.href=the_link;
  });

});

