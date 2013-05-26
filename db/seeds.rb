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


@new_post = Post.new(
  :user => users.sample,
  :title => 'Forms',
  :video_url => 'https://www.youtube.com/watch?v=OnptThLQb_k&feature=player_embedded',
  :content => 'XXXXXXXXX'
)
@new_post.tag_list = "HTML, Forms"
@new_post.save
@new_post.reload

@new_post = Post.new(
  :user => users.sample,
  :title => 'Content Type',
  :video_url => 'https://www.youtube.com/watch?v=a0k61hlrO9M&feature=player_embedded',
  :content => 'XXXXXXXXX'
)
@new_post.tag_list = "HTML"
@new_post.save
@new_post.reload

@new_post = Post.new(
  :user => users.sample,
  :title => 'Differences Between Get And Post',
  :video_url => 'https://www.youtube.com/watch?v=UObINRj2EGY&feature=player_embedded',
  :content => 'XXXXXXXXX'
)
@new_post.tag_list = "GET, POST, HTTP"
@new_post.save
@new_post.reload

@new_post = Post.new(
  :user => users.sample,
  :title => 'This is Water',
  :video_url => 'http://vimeo.com/65823244',
  :content => 'XXXXXXXXX'
)
@new_post.tag_list = "iceberg"
@new_post.save
@new_post.reload

@new_post = Post.new(
  :user => users.sample,
  :title => 'John Cleese - a lecture on Creativity',
  :video_url => 'http://www.youtube.com/watch?feature=player_detailpage&v=ijtQP9nwrQA',
  :content => 'XXXXXXXXX'
)
@new_post.tag_list = "creativity"
@new_post.save
@new_post.reload

@new_post = Post.new(
  :user => users.sample,
  :title => 'DDOS on the VideoLAN',
  :video_url => 'http://www.youtube.com/watch?feature=player_detailpage&v=hNjdBSoIa8k',
  :content => 'XXXXXXXXX'
)
@new_post.tag_list = "ddos, security"
@new_post.save
@new_post.reload

@new_post = Post.new(
  :user => users.sample,
  :title => 'How to set up a JavaScript build system for Sublime Text',
  :video_url => 'http://www.youtube.com/watch?feature=player_detailpage&v=W_TzeL4OhL0',
  :content => 'XXXXXXXXX'
)
@new_post.tag_list = "sublime, javascript"
@new_post.save
@new_post.reload

@new_post = Post.new(
  :user => users.sample,
  :title => 'Sublime Web Inspector Screencast',
  :video_url => 'http://www.youtube.com/watch?feature=player_detailpage&v=LaH_43N34Jg',
  :content => 'XXXXXXXXX'
)
@new_post.tag_list = "sublime, screencast"
@new_post.save
@new_post.reload

@new_post = Post.new(
  :user => users.sample,
  :title => 'Firefox CSS live edit in Sublime',
  :video_url => 'http://www.youtube.com/watch?feature=player_detailpage&v=UrnB8lZnx4I',
  :content => 'XXXXXXXXX'
)
@new_post.tag_list = "sublime, css, firefox"
@new_post.save
@new_post.reload

posts = Post.all



posts.each do |post|
  3.times do
    post.comments.create(
      :user => users.sample,
      :title => Faker::Company.name,
      :comment => Faker::Company.bs
    )
  end
end




users.each do |user|
  posts.each do |post|

    if rand(5) < 3
      post.liked_by user
    else
      post.downvote_from user
    end

    post.comments.each do |comment|
      if rand(5) < 3
        comment.liked_by user
      else
        comment.downvote_from user
      end
    end

  end
end

