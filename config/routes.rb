# frozen_string_literal: true

Rails.application.routes.draw do
  resources 'services' , only: %i[index new create]
  
  resources :tour_packages
  resources :products, only: %i[index show]

  resources :profiles, only: %i[edit update]

  authenticate :user, ->(user) { user.admin_role_type? } do
    mount Avo::Engine => '/avo'
  end

  # mount Avo::Engine, at: Avo.configuration.root_path
  resources :destinations, only: %i[index show]
  resources :tours
  # , only: %i[index show]
  devise_for :users

  get :search, controller: :destinations
  
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  get '/blog', to: 'home#blog'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
