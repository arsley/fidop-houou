Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :administrators
      resources :mahjong_jansous
      resources :mahjong_games
      resources :mahjong_matches
      resources :members
    end
  end
end
