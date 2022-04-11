Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  get 'organizations/index'
  get 'properties/index'
  get 'users/index'
  get 'periods/index'
  get 'periods/new'
  get 'passwords/edit', to: 'passwords#edit'
  patch  'passwords/edit', to: 'passwords#update'
  post  'passwords/edit', to: 'passwords#update'
  post 'updates/new'

  resources :users do
    member do
      resources :projects
    end
  end
  resources :organizations
  resources :properties
  resources :updates do 
    collection { post :import}
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
