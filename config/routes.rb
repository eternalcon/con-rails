Rails.application.routes.draw do
  # set something as root to: for now, since active_admin requires some sort of root.
  # to be replaced as soon as a true root is present in the app.
  root to: "home#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
