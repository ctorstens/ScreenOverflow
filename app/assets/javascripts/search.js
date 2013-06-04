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

  window.setInterval(function(){
    clear_typeahead();
  }, 15 * 1e3); // Set search db reset to q 15 sec

});