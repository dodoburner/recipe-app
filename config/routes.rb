Rails.application.routes.draw do
  devise_for :users, path: ''
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'recipes#public'
  get '/public_recipes', to: 'recipes#public'

  resources :recipes do
    resources :foods, only: [:new, :create, :destroy]
  end
end
