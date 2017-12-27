Rails.application.routes.draw do
  scope "(:locale)", locale: /en|de/ do
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
    root to: "events#index"
    devise_for :users
    resources :events, only: [ :index ] do
      resources :event_registrations
    end
    resources :event_registrations do
      #post 'preview', on: :collection
      resources :events, :participants, :users
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
