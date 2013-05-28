
$(document).ready(function () {
  $('#typeahead_search').typeahead([
    {
      name: 'search-users',
      prefetch: 'users/search',
      header: "<h3 class='category_name'>Users</h3>",
      limit: 3
    },

    {
      name: 'search-posts',
      prefetch: 'posts/search',
      header: "<h3 class='category_name'>Posts</h3>",
      limit: 3
    },

    {
      name: 'search-tags',
      prefetch: 'tags/search',
      header: "<h3 class='category_name'>Tags</h3>",
      limit: 3
    }

  ]);

  $('#typeahead_search').on('typeahead:selected', function (d) {
    console.log(d);
  });


});