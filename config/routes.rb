ScreenOverflow::Application.routes.draw do

  root :to => 'home#index'

  resources :posts 
  resources :users
  resources :comments

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  match "/posts/:id/vote" => "votes#create", :as => :post_vote
  match "/posts/:id/comment/:id/vote" => "votes#create", :as => :comment_vote

  get 'tags/:name' => 'tags#show'
  get '/tags' => 'tags#index'

end
