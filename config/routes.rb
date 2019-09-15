Rails.application.routes.draw do
  root to: "site#index"

  get "about", to: "site#about"
  get "author", to: "site#author"
  get "users_works", to: "site#users_works"
end
