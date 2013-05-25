ScreenOverflow::Application.routes.draw do

  resources :posts 
  resources :users


  get 'tags/:name' => 'tags#show'
  get '/tags' => 'tags#index'

  
  root :to => 'home#index'
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

end
