# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  
  resources 'services' , only: %i[index new create]

  resources 'bookings' , only: %i[index new create]
  
  resources :tour_packages
  
  resources :products, only: %i[index show]

  resources :profiles, only: %i[edit update]

  authenticate :user, ->(user) { user.admin_role_type? } do
    mount Avo::Engine => '/avo'
    mount Sidekiq::Web => '/sidekiq'
  end

  # mount Avo::Engine, at: Avo.configuration.root_path
  resources :destinations, only: %i[index show]
  resources :tours , only: %i[index show]
  devise_for :users

  get :search, controller: :bookings
  
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  get '/blog', to: 'home#blog'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  post 'line_items' => "line_items#create"
  post 'update_cart' => "carts#update_cart"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  
  get 'cart' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  
  root 'home#index'
end
