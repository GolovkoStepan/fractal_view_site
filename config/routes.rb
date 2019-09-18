Rails.application.routes.draw do
  root to: "site#index"

  devise_for :users

  resources :posts

  get "download", to: "site#download"
  get "author", to: "site#author"

end
