Rails.application.routes.draw do
  root 'pages#home'
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'

  # For enabling only some of the REST routes for articles (list them)
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update]

  # For enabling all REST routes for articles
  resources :articles

  get 'signup', to: 'users#new'      # Signup form
  #post 'users', to: 'users#create'
  resources :users, except: [:new]
end