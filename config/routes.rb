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

  resources :recipes, only: [:index, :new, :show, :destroy, :create] do
    resources :recipe_foods
  end
  resources :inventories, only: [:index, :new, :show, :destroy, :create] do
    resources :inventory_foods
  end 

  root 'recipes#public'
  get '/public_recipes', to: 'recipes#public'

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes do
    resources :shopping_lists
    resources :recipe_foods, only: [:new, :create, :destroy]
  end

  resources :shopping_list
end
