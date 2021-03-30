Rails.application.routes.draw do
  get "login" => "users#login_form"
  post "login" => "users#login"
  
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  post "posts/:id/destroy" => "posts#destroy"
  
  get '/' => "home#top"
  
end
