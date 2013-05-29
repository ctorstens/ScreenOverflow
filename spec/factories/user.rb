FactoryGirl.define do
	factory :user do |f|
		email 'screenoverflow@gmail.com'
    password_digest 'mvclover' 
    username 'jay_flow'
    provider 'google'
    uid '1234567'
  end
end
