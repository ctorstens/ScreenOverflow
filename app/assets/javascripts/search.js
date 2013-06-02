function clear_typeahead() {
  $('#typeahead_search')
    .typeahead('destroy')
    .typeahead({
      prefetch: '/users/search',
      prefetch: '/posts/search',
      prefetch: '/tags/search',
    });
};

$(document).ready(function () {
  $('#typeahead_search').typeahead([
    {
      // name: 'search-users',
      prefetch: '/users/search',
      header: "<h3 class='category_name'>Users</h3>",
      limit: 3
    },

    {
      // name: 'search-posts',
      prefetch: '/posts/search',
      header: "<h3 class='category_name'>Posts</h3>",
      limit: 3
    },

    {
      // name: 'search-tags',
      prefetch: '/tags/search',
      header: "<h3 class='category_name'>Tags</h3>",
      limit: 3
    }

  ]);

  $('#typeahead_search').on('typeahead:selected', function (e, obj) {
    console.log(obj);
    window.location = obj.url;
  });

  // Set search db reset to q hour
  window.setInterval(function(){
    clear_typeahead();
  }, 60 * 60 * 1e3);

  // reset search with comment/post submission
  $('.btn').on('click', function() {
    clear_typeahead();
  });

});