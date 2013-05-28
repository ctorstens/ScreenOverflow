FactoryGirl.define do
	factory :post do |f|
		title "I'm a Title"
		video_url "https://www.youtube.com/watch?v=a0k61hlrO9M&feature=player_embedded"
		content "Here is a doggy video"
		user
	end

end

