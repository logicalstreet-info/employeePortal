Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  get 'organizations/index'
  
  get 'passwords/edit', to: 'passwords#edit'
  patch  'passwords/edit', to: 'passwords#update'
  post  'passwords/edit', to: 'passwords#update'
  resources :organizations
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
