Rails.application.routes.draw do
  root to: "site#index"

  devise_for :users

  resources :posts do
    resources :comments
  end

  # Site
  get "download", to: "site#download"

  # Account
  get "account/user_info", to: "accounts#user_info"
  patch "account/update_user_info", to: "accounts#update_user_info"
  get "account/notifications", to: "accounts#notifications"
  get "account/my_posts", to: "accounts#my_posts"

end
