
$(document).ready(function () {
  $('#typeahead_search').typeahead([
    {
      name: 'users',
      prefetch: 'users/search',
      header: "<h3 class='category_name'>Users</h3>",
      limit: 3
    },

    {
      name: 'posts',
      prefetch: 'posts/search',
      header: "<h3 class='category_name'>Posts</h3>",
      limit: 3
    },

    {
      name: 'tags',
      prefetch: 'tags/search',
      header: "<h3 class='category_name'>Tags</h3>",
      limit: 3
    }
  ]);
});