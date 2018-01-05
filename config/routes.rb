Rails.application.routes.draw do
  scope "(:locale)", locale: /en|de/ do
    get "/pages/:id" => "high_voltage/pages#show", :as => :page, :format => false
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
  constraints(token: /[A-Z][A-Z][0-9]+/ ) do
    resources :registration_overview, only: [:index, :update]
  end
end
