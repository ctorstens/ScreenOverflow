
$(document).ready(function () {
  $('#typeahead_search').typeahead([
    {
      name: 'users',
      remote: 'users/search',
      prefetch: 'users/search',
      header: "<h3 class='category_name'>Users</h3>"
    },

    {
      name: 'posts',
      remote: 'posts/search',
      prefetch: 'posts/search',
      header: "<h3 class='category_name'>Posts</h3>"
    },

    {
      name: 'tags',
      remote: 'tags/search',
      prefetch: 'tags/search',
      header: "<h3 class='category_name'>Tags</h3>"
    }
  ]);
});