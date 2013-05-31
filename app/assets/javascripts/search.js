
$(document).ready(function () {
  $('#typeahead_search').typeahead([
    {
      name: 'search-users',
      ttl_ms: 1000,
      prefetch: '/users/search',
      header: "<h3 class='category_name'>Users</h3>",
      limit: 3
    },

    {
      name: 'search-posts',
      ttl_ms: 1000,
      prefetch: '/posts/search',
      header: "<h3 class='category_name'>Posts</h3>",
      limit: 3
    },

    {
      name: 'search-tags',
      ttl_ms: 1000,
      prefetch: '/tags/search',
      header: "<h3 class='category_name'>Tags</h3>",
      limit: 3
    }

  ]);

  $('#typeahead_search').on('typeahead:selected', function (e, obj) {
    console.log(obj);
    window.location = obj.url;
  });


});