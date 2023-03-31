# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products , only: [:index,:show ]
  
  resources :profiles ,only: [:edit, :update]
  
  authenticate :user, -> user { user.admin_role_type? } do
    mount Avo::Engine => '/avo'
  end
  
  # mount Avo::Engine, at: Avo.configuration.root_path
  resources :destinations, only: [:index,:show ]
  resources :tours, only: [:index,:show ]
  devise_for :users

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  get '/blog', to: 'home#blog'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
