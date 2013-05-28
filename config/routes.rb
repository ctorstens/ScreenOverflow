ScreenOverflow::Application.routes.draw do

  root :to => 'home#index'

  resources :posts 
  resources :users
  resources :comments

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  match "/posts/:id/vote" => "votes#post_vote", :as => :post_vote
  match "/posts/:id/comment/:id/vote" => "votes#comment_vote", :as => :comment_vote

  get 'tags/:name' => 'tags#show'
  get '/tags' => 'tags#index'

  get '/youtube_url' => 'posts#youtube_meta'

end
