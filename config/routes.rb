Rails.application.routes.draw do
  get 'inventories/index'
  get 'inventories/show'
  get 'inventories/new'
  devise_for :users, path: ''
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "users#index"

  resources :users
  resources :foods
  resources :inventories
end
