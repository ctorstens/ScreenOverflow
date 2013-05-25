ScreenOverflow::Application.routes.draw do

  root :to => 'home#index'

  resources :posts 
  
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

end
