Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  get 'organizations/index'
  get 'organizations/admin_index'
  get 'properties/index'
  get 'users/index'
  get 'periods/index'
  get 'periods/new'
  get 'passwords/edit', to: 'passwords#edit'
  post 'updates/new'
  post 'leave_applications/new'
  get  'employees',  to: 'users#new'
  post 'employees',  to: 'users#add_user'
  get 'leave_balances/index'
  
  resources :passwords do
    member do
      get 'edit_password'
      patch 'edit_password'
      patch 'update_password'
    end
  end
  resources :leave_days 
  resources :notifications 
  resources :organizations
  resources :properties

  resources :groups do 
    resources :messages
  end

  resources :users do
    member do
      get 'user_profile'
      get 'edit_user'
      patch 'edit_user'
      patch 'update_user'
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
