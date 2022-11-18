# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'inventory_foods/index'
  # get 'inventory_foods/new'
  # get 'inventory_foods/show'
  # get 'inventories/index'
  # get 'inventories/show'
  # get 'inventories/new'
  # devise_for :users, path: ''
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users, sign_out_via: [:get, :post]

  resources :foods 
  # resources :users, only: [:index]
  resources :recipes, only: [:index, :new, :show, :destroy, :create] do
    resources :recipe_foods
  end
  resources :inventories, only: [:index, :new, :show, :destroy, :create] do
    resources :inventory_foods
  end 
  # resources :users
  #   resources :inventories
  # end
  root 'recipes#index'
  get '/public_recipes', to: 'recipes#public'

  resources :recipes do
    resources :foods, only: [:new, :create, :destroy]
  end

  resources :shopping_list
end
