Rails.application.routes.draw do
  scope "(:locale)", locale: /en|de/ do
    get "/pages/:id" => "high_voltage/pages#show", :as => :page, :format => false
    devise_for :admin_users
    devise_for :users
    root to: "events#index"
    resources :events, only: [ :index ]
    resources :event_registrations do
      #post 'preview', on: :collection
      resources :events, :participants, :users
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
