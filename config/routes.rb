Rails.application.routes.draw do
  get "comments/new" => "comments#new"
  post "comments/create" => "comments/create"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  post "posts/:id/destroy" => "posts#destroy"
  
  get '/' => "home#top"
  
end
