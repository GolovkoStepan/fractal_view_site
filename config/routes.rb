Rails.application.routes.draw do
  devise_for :users
  root to: "site#index"

  get "download", to: "site#download"
  get "author", to: "site#author"
  get "users_works", to: "site#users_works"
end
