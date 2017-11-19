Rails.application.routes.draw do
  
  root to: "events#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  
  scope "(:locale)", locale: /en|de/ do
    devise_for :users
    resources :events, only: [ :index ]
    resources :registrations
  end
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
