Rails.application.routes.draw do

  resources :user_conversations
  resources :member_networks
  resources :networks
      resources :band_genres
      resources :user_bands
      resources :bands
      resources :user_instruments
      resources :user_genres
      resources :friend_requests
      resources :messages
      resources :conversations
      resources :friendships
      resources :cities
      resources :genres
      resources :instruments
      resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users/:id/conversations', to: 'users#show_conversations'

end
