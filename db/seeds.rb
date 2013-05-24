# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


USERS_NUM = 70
COMMENTS_NUM = USERS_NUM * 3

USERS_NUM.times do
  User.create(
    :email => Faker::Internet.email,
    :username => Faker::Internet.user_name,
    :name => Faker::Name.name
  )
end
users = User.all 

Tag.create(
  :description => 'rails'
)

Tag.create(
  :description => 'fiery_skippers'
)

Tag.create(
  :description => 'ed_shadi'
)

Tag.create(
  :description => 'ajax'
)

Tag.create(
  :description => 'steve_huffman'
)

Tag.create(
  :description => 'zee'
)

Tag.create(
  :description => 'dbc'
)

Tag.create(
  :description => 'html'
)

Tag.create(
  :description => 'css'
)

Tag.create(
  :description => 'yaml'
)

Tag.create(
  :description => 'haml'
)

Tag.create(
  :description => 'jQuery'
)

Tag.create(
  :description => 'ruby'
)

Tag.create(
  :description => 'github'
)

Tag.create(
  :description => 'sql'
)

Tag.create(
  :description => 'postgres'
)

Tag.create(
  :description => 'gems'
)


tags = Tag.all

Post.create(
  :user => users.sample,
  :title => 'Forms',
  :video_url => 'https://www.youtube.com/watch?v=OnptThLQb_k&feature=player_embedded',
  :content => 'XXXXXXXXX'
)

Post.create(
  :user => users.sample,
  :title => 'Content Type',
  :video_url => 'https://www.youtube.com/watch?v=a0k61hlrO9M&feature=player_embedded',
  :content => 'XXXXXXXXX'
)

Post.create(
  :user => users.sample,
  :title => 'Differences Between Get And Post',
  :video_url => 'https://www.youtube.com/watch?v=UObINRj2EGY&feature=player_embedded',
  :content => 'XXXXXXXXX'
)

Post.create(
  :user => users.sample,
  :title => 'This is Water',
  :video_url => 'http://vimeo.com/65823244',
  :content => 'XXXXXXXXX'
)

Post.create(
  :user => users.sample,
  :title => 'John Cleese - a lecture on Creativity',
  :video_url => 'http://www.youtube.com/watch?feature=player_detailpage&v=ijtQP9nwrQA',
  :content => 'XXXXXXXXX'
)

Post.create(
  :user => users.sample,
  :title => 'DDOS on the VideoLAN',
  :video_url => 'http://www.youtube.com/watch?feature=player_detailpage&v=hNjdBSoIa8k',
  :content => 'XXXXXXXXX'
)

Post.create(
  :user => users.sample,
  :title => 'How to set up a JavaScript build system for Sublime Text',
  :video_url => 'http://www.youtube.com/watch?feature=player_detailpage&v=W_TzeL4OhL0',
  :content => 'XXXXXXXXX'
)

Post.create(
  :user => users.sample,
  :title => 'Sublime Web Inspector Screencast',
  :video_url => 'http://www.youtube.com/watch?feature=player_detailpage&v=LaH_43N34Jg',
  :content => 'XXXXXXXXX'
)

Post.create(
  :user => users.sample,
  :title => 'Firefox CSS live edit in Sublime',
  :video_url => 'http://www.youtube.com/watch?feature=player_detailpage&v=UrnB8lZnx4I',
  :content => 'XXXXXXXXX'
)

posts = Post.all


tags.each do |tag|
  posts.each do |post|
    post.tags << tag if rand(5) < 3
  end
end

COMMENTS_NUM.times do
  Comment.create(
    :user => users.sample,
    :post => posts.sample,
    :content => Faker::Company.bs
  )
end

users.each do |user|
  posts.each do |post|
    Vote.create(
      :user => user,
      :votable => post,
      :value => 1
    ) if rand(5) < 2
    post.comments.each do |comment|
      Vote.create(
        :user => user,
        :votable => comment,
        :value => 1
      ) if rand(5) < 2
    end
  end
end

