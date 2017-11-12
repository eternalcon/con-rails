Rails.application.routes.draw do
  root to: "events#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  scope "(:locale)", locale: /en|de/ do
    resources :events, only: [ :index ]  
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
