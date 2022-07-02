# == Route Map
#

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'auth/create'
      delete 'auth/destroy'

      resources :administrators
      resources :jansous
      resources :games
      resources :matches
      resources :members
    end
  end
end
