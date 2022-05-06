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
  post 'leave_applications/new'

  resources :leave_days 
  resources :notifications 
  resources :organizations
  resources :properties

  resources :groups do 
    resources :messages
  end

  resources :users do
    member do
      resources :projects
    end
  end
  
  resources :updates do 
    collection { post :import}
  end
  
  resources :leave_applications do
    member do
      patch 'approve'
      post 'approve'
      patch 'reject'
      get 'reject'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
