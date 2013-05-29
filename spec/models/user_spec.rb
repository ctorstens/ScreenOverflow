require 'spec_helper'

describe User do
	let(:user) {create(:user)} 

	it "can find a user by provider and uid" do
		User.find_by_provider_and_uid(user.provider, user.uid).should eq(user)
	end

	it "can create a new user" do
		auth = {'info' =>{ 'name' => 'Kris', 'email' => 'kris@kris.com', 'first_name' => 'Kris', 'last_name' => 'Hines', 'image_url' => 'url'}, 
		'credentials' =>{ 'token' => "823746222", 'refresh_token' => "2873629871", 'expires_at' => "63/58/0393", 'expires' =>"63/58/0393"}, 
		'provider' => "google", 'uid' =>"99487393"}
		User.create_with_omniauth(auth).should be_an_instance_of(User)
	end
end




