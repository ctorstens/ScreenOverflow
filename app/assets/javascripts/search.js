
$(document).ready(function () {
  $('#typeahead_search').typeahead([
    {
      name: 'users',
      // remote: 'users/search',
      prefetch: 'users/search',
      // local: ["Chris Torstenson", "Wilton Hodkiewicz IV", "Eula Marks", "Ms. Roxanne Schumm", "Makayla McGlynn DDS", "Ms. Robb Greenfelder", "Gerry Ferry", "Frederick Larkin", "Trevion Rutherford", "Dr. Robb Murphy", "Virgil Bernhard"],
      header: "<h3 class='category_name'>Users</h3>",
      limit: 3
    },

    {
      name: 'posts',
      // remote: 'posts/search',
      prefetch: 'posts/search',
      header: "<h3 class='category_name'>Posts</h3>",
      limit: 3
    },

    {
      name: 'tags',
      // remote: 'tags/search',
      prefetch: 'tags/search',
      header: "<h3 class='category_name'>Tags</h3>",
      limit: 3
    }
  ]);
});