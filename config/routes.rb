# == Route Map
#
#                       Prefix Verb   URI Pattern                                                                 Controller#Action
#                         root GET    /                                                                           groups#index
#                        posts GET    /posts(.:format)                                                            posts#search
#                        users GET    /users(.:format)                                                            users#search
#     group_user_post_comments GET    /groups/:group_id/users/:user_id/posts/:post_id/comments(.:format)          comments#index
#                              POST   /groups/:group_id/users/:user_id/posts/:post_id/comments(.:format)          comments#create
#  new_group_user_post_comment GET    /groups/:group_id/users/:user_id/posts/:post_id/comments/new(.:format)      comments#new
# edit_group_user_post_comment GET    /groups/:group_id/users/:user_id/posts/:post_id/comments/:id/edit(.:format) comments#edit
#      group_user_post_comment GET    /groups/:group_id/users/:user_id/posts/:post_id/comments/:id(.:format)      comments#show
#                              PATCH  /groups/:group_id/users/:user_id/posts/:post_id/comments/:id(.:format)      comments#update
#                              PUT    /groups/:group_id/users/:user_id/posts/:post_id/comments/:id(.:format)      comments#update
#                              DELETE /groups/:group_id/users/:user_id/posts/:post_id/comments/:id(.:format)      comments#destroy
#             group_user_posts GET    /groups/:group_id/users/:user_id/posts(.:format)                            posts#index
#                              POST   /groups/:group_id/users/:user_id/posts(.:format)                            posts#create
#          new_group_user_post GET    /groups/:group_id/users/:user_id/posts/new(.:format)                        posts#new
#         edit_group_user_post GET    /groups/:group_id/users/:user_id/posts/:id/edit(.:format)                   posts#edit
#              group_user_post GET    /groups/:group_id/users/:user_id/posts/:id(.:format)                        posts#show
#                              PATCH  /groups/:group_id/users/:user_id/posts/:id(.:format)                        posts#update
#                              PUT    /groups/:group_id/users/:user_id/posts/:id(.:format)                        posts#update
#                              DELETE /groups/:group_id/users/:user_id/posts/:id(.:format)                        posts#destroy
#                  group_users GET    /groups/:group_id/users(.:format)                                           users#index
#                              POST   /groups/:group_id/users(.:format)                                           users#create
#               new_group_user GET    /groups/:group_id/users/new(.:format)                                       users#new
#              edit_group_user GET    /groups/:group_id/users/:id/edit(.:format)                                  users#edit
#                   group_user GET    /groups/:group_id/users/:id(.:format)                                       users#show
#                              PATCH  /groups/:group_id/users/:id(.:format)                                       users#update
#                              PUT    /groups/:group_id/users/:id(.:format)                                       users#update
#                              DELETE /groups/:group_id/users/:id(.:format)                                       users#destroy
#                       groups GET    /groups(.:format)                                                           groups#index
#                              POST   /groups(.:format)                                                           groups#create
#                    new_group GET    /groups/new(.:format)                                                       groups#new
#                   edit_group GET    /groups/:id/edit(.:format)                                                  groups#edit
#                        group GET    /groups/:id(.:format)                                                       groups#show
#                              PATCH  /groups/:id(.:format)                                                       groups#update
#                              PUT    /groups/:id(.:format)                                                       groups#update
#                              DELETE /groups/:id(.:format)                                                       groups#destroy
#                        login GET    /login(.:format)                                                            session#new
#                              POST   /login(.:format)                                                            session#create
#                              DELETE /login(.:format)                                                            session#destroy
#

Rails.application.routes.draw do

  resources :quotes
  get 'password_resets/new'

  root :to => 'groups#index'

  get '/posts' => 'posts#search', :as => "posts"
  get '/users' => 'users#search', :as => "users"

  resources :groups do
    resources :users do 
      resources :posts do
        resources :comments do
        end   
      end
    end
  end

  resources :password_resets


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  
end
