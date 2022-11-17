Rails.application.routes.draw do
  devise_for :users, path: ''
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'recipes#index'

  resources :users do
    resources :foods
    resources :recipes
  end
end
