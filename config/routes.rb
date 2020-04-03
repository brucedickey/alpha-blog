Rails.application.routes.draw do
  root 'pages#home'
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'

  # For enabling only some of the REST routes
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update]

  # For enabling all REST routes
  resources :articles
end