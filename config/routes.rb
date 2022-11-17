Rails.application.routes.draw do
  devise_for :users, path: ''
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#index'
  get '/public_recipes', to: 'recipes#public'

  resources :users do
    resources :foods
    resources :recipes
  end
end
