Rails.application.routes.draw do
  get "/" => "home#home"
  post "home/change_to_your" => "home#change_to_your"
  post "home/change_to_global" => "home#change_to_global"
  post "login" => "application#login"

  get "register" => "users#new"
  post "new" => "users#create"
  post "logout" => "users#logout"
  get "login" => "users#login"
  get "users/:id/edit" => "users#edit"
  get "users/:id" => "users#show"

  post "articles/:id/destroy" => "articles#destroy"
  post "articles/:id/edit" => "articles#update"
  post "articles/create" => "articles#create"
  get "articles/new" => "articles#new"
  get "articles/:id/edit" => "articles#edit"
  get "articles/:id" => "articles#show"
end
