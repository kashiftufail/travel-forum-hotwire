Rails.application.routes.draw do
  devise_for :users
  get 'pages/about'
  get 'pages/contact'
  get 'home/blog'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
