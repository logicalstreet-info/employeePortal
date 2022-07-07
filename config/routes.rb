Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  get 'organizations/index'
  get 'organizations/admin_index'
  get 'organizations/:id/super_fetaure_edit', to: 'organizations#super_fetaure_edit', as: :super_fetaure_edit
  patch 'organizations/:id', to: 'organizations#super_fetaure_update', as: :super_fetaure_update
  get 'properties/index'
  get 'users/index'
  get 'periods/index'
  get 'periods/new'
  get 'passwords/edit', to: 'passwords#edit'
  post 'updates/new'
  post 'leave_applications/new'
  post 'leave_applications/get_calculated_leaves'
  get  'employees',  to: 'users#new'
  post 'employees',  to: 'users#add_user'
  get 'leave_balances/index'
  get 'users/switch_and_redirect_view'
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
  resources :bonds

  resources :groups do 
    resources :messages
  end

  resources :users do
    member do
      get 'user_profile'
      get 'edit_user'
      patch 'edit_user'
      patch 'update_user'
      post 'assign_admin_role'
      post 'remove_admin_role'
      resources :projects
    end
  end
  
  resources :updates do 
    collection { post :import}
  end
  
  resources :leave_applications do
    member do
      patch 'approve'
      get 'approve'
      patch 'reject'
      get 'reject'
    end
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :projects
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
