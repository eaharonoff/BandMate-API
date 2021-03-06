Rails.application.routes.draw do

        resources :user_conversations
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

        get '/users/:id/conversations', to: 'users#show_conversations'
        post '/users/login', to: 'users#login'
        post '/user', to: 'users#update'
        post '/users/filter', to: 'users#filter'
        post '/friend_requests/delete', to: 'friend_requests#delete'
        post '/conversations/delete', to: 'conversations#delete'
      end
