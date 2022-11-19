# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

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
