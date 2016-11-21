Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  match 'user_token' => 'user_token#create', via: :options
  jsonapi_resources :users do
    jsonapi_resources :password_updates, via: :post
  end
  jsonapi_resources :excercises
  jsonapi_resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
