# == Route Map
#
#       Prefix Verb   URI Pattern                  Controller#Action
#         root GET    /                            groups#index
#     comments GET    /comments(.:format)          comments#index
#              POST   /comments(.:format)          comments#create
#  new_comment GET    /comments/new(.:format)      comments#new
# edit_comment GET    /comments/:id/edit(.:format) comments#edit
#      comment GET    /comments/:id(.:format)      comments#show
#              PATCH  /comments/:id(.:format)      comments#update
#              PUT    /comments/:id(.:format)      comments#update
#              DELETE /comments/:id(.:format)      comments#destroy
#        posts GET    /posts(.:format)             posts#index
#              POST   /posts(.:format)             posts#create
#     new_post GET    /posts/new(.:format)         posts#new
#    edit_post GET    /posts/:id/edit(.:format)    posts#edit
#         post GET    /posts/:id(.:format)         posts#show
#              PATCH  /posts/:id(.:format)         posts#update
#              PUT    /posts/:id(.:format)         posts#update
#              DELETE /posts/:id(.:format)         posts#destroy
#        users GET    /users(.:format)             users#index
#              POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#    edit_user GET    /users/:id/edit(.:format)    users#edit
#         user GET    /users/:id(.:format)         users#show
#              PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#              DELETE /users/:id(.:format)         users#destroy
#       groups GET    /groups(.:format)            groups#index
#              POST   /groups(.:format)            groups#create
#    new_group GET    /groups/new(.:format)        groups#new
#   edit_group GET    /groups/:id/edit(.:format)   groups#edit
#        group GET    /groups/:id(.:format)        groups#show
#              PATCH  /groups/:id(.:format)        groups#update
#              PUT    /groups/:id(.:format)        groups#update
#              DELETE /groups/:id(.:format)        groups#destroy
#

Rails.application.routes.draw do
  root :to => 'groups#index'

  resources :comments
  resources :posts
  resources :users
  resources :groups


end
