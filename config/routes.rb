Rails.application.routes.draw do
  get 'home/top'
  get "posts" => "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
