Rails.application.routes.draw do
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  
  scope "(:locale)", locale: /en|de/ do
    root to: "events#index"
    
    resources :events, only: [ :index ]
    resources :event_registrations
    devise_for :users
  end
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
