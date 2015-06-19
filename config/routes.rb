Rails.application.routes.draw do
  root :to => 'groups#index'

  resources :comments
  resources :posts
  resources :users
  resources :groups


end
