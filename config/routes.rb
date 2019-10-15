Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: "site#index"

  devise_for :users

  resources :posts do
    resources :comments
  end

  # Site
  get "download", to: "site#download"
  get 'online_view', to: 'site#online_view'

  # Accounts
  get "account/user_info", to: "accounts#user_info"
  patch "account/update_user_info", to: "accounts#update_user_info"
  get "account/notifications", to: "accounts#notifications"
  get "account/my_posts", to: "accounts#my_posts"

  # Notifications
  get "account/notifications/:id/read", to: "notifications#read", as: "account_notification_read"
  get "account/notifications/read", to: "notifications#read_all"

end
