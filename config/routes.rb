Rails.application.routes.draw do
  resources :mahjong_games
  resources :mahjong_matches
  resources :members
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
