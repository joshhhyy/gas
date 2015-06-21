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