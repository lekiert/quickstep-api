Rails.application.routes.draw do
  resources :groups
  post 'user_token' => 'user_token#create'
  match 'user_token' => 'user_token#create', via: :options
  jsonapi_resources :excercises
  jsonapi_resources :courses
  jsonapi_resources :tests
  jsonapi_resources :users
  jsonapi_resources :teachers
  jsonapi_resources :groups
  jsonapi_resources :user_logs
  jsonapi_resources :groups do
    jsonapi_relationships
  end
  jsonapi_resources :users do
    jsonapi_resources :password_updates
  end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
