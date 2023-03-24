# frozen_string_literal: true

Rails.application.routes.draw do
  resources :destinations
  resources :tours
  devise_for :users

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  get '/blog', to: 'home#blog'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
