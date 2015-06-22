# == Route Map
#
#               Prefix Verb   URI Pattern                                               Controller#Action
#                 root GET    /                                                         groups#index
#     group_user_posts GET    /groups/:group_id/users/:user_id/posts(.:format)          posts#index
#                      POST   /groups/:group_id/users/:user_id/posts(.:format)          posts#create
#  new_group_user_post GET    /groups/:group_id/users/:user_id/posts/new(.:format)      posts#new
# edit_group_user_post GET    /groups/:group_id/users/:user_id/posts/:id/edit(.:format) posts#edit
#      group_user_post GET    /groups/:group_id/users/:user_id/posts/:id(.:format)      posts#show
#                      PATCH  /groups/:group_id/users/:user_id/posts/:id(.:format)      posts#update
#                      PUT    /groups/:group_id/users/:user_id/posts/:id(.:format)      posts#update
#                      DELETE /groups/:group_id/users/:user_id/posts/:id(.:format)      posts#destroy
#          group_users GET    /groups/:group_id/users(.:format)                         users#index
#                      POST   /groups/:group_id/users(.:format)                         users#create
#       new_group_user GET    /groups/:group_id/users/new(.:format)                     users#new
#      edit_group_user GET    /groups/:group_id/users/:id/edit(.:format)                users#edit
#           group_user GET    /groups/:group_id/users/:id(.:format)                     users#show
#                      PATCH  /groups/:group_id/users/:id(.:format)                     users#update
#                      PUT    /groups/:group_id/users/:id(.:format)                     users#update
#                      DELETE /groups/:group_id/users/:id(.:format)                     users#destroy
#               groups GET    /groups(.:format)                                         groups#index
#                      POST   /groups(.:format)                                         groups#create
#            new_group GET    /groups/new(.:format)                                     groups#new
#           edit_group GET    /groups/:id/edit(.:format)                                groups#edit
#                group GET    /groups/:id(.:format)                                     groups#show
#                      PATCH  /groups/:id(.:format)                                     groups#update
#                      PUT    /groups/:id(.:format)                                     groups#update
#                      DELETE /groups/:id(.:format)                                     groups#destroy
#                login GET    /login(.:format)                                          session#new
#                      POST   /login(.:format)                                          session#create
#                      DELETE /login(.:format)                                          session#destroy
#

Rails.application.routes.draw do

 root :to => 'groups#index'
 
  resources :groups do
     resources :users do 
       resources :posts do
       end
     end
   end


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  
end
