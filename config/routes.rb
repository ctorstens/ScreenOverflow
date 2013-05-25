ScreenOverflow::Application.routes.draw do

  root :to => 'home#index'

  resources :posts 
  resources :users

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  get 'tags/:name' => 'tags#show'
  get '/tags' => 'tags#index'

end
