Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
            # resources :band_genres
            # resources :user_bands
            resources :bands
            # resources :user_instruments
            # resources :user_genres
            resources :friend_requests
            resources :messages
            resources :conversations
            resources :friendships
            resources :cities
            resources :genres
            resources :instruments
            resources :users
      end
    end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


