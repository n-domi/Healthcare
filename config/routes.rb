Rails.application.routes.draw do

  root 'users#new'

  post "goodfeelings/:record_id/create" => "goodfeelings#create"
  post "goodfeelings/:record_id/destroy" => "goodfeelings#destroy"

  post "badfeelings/:record_id/create" => "badfeelings#create"
  post "badfeelings/:record_id/destroy" => "badfeelings#destroy"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  # get "users/index" => "users#index"
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  get "users/:id/goodfeelings" => "users#goodfeelings"
  get "users/:id/badfeelings" => "users#badfeelings"

  get "records/index" => "records#index"
  get "records/new" => "records#new"
  get "records/:id" => "records#show"
  post "records/create" => "records#create"
  get "records/:id/edit" => "records#edit"
  post "records/:id/update" => "records#update"
  post "records/:id/destroy" => "records#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
