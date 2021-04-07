Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/" =>  "home#index"
  #get "menus", to: "menus#index"
  resources :users
  resources :menus
  resources :carts
  resources :orders
  resources :admins
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  get "/olditem" => "admins#olditem", as: :old_items

end
