Rails.application.routes.draw do
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/:id/destroy" => "posts#destroy"
  post "posts/create" => "posts#create"
  get '/' => "home#top"
  
end
