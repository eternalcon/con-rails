Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  
  scope "(:locale)", locale: /en-US|de-DE/ do
    resources :events, only: [ :index ]  
  end
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
