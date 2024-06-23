# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'


      resources :users, only: :index
      resources :favourites, only: %i[index create destroy]
      resources :cars, only: %i[index  show destroy]
      # resources :test_drives, only: %i[index destroy]
      post 'add_car', to: 'cars#create'
      post 'test_drive', to: 'test_drives#create'
      post 'login', to: 'authentication#create'
      post 'register', to: 'users#create'

      get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
