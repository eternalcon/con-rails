Rails.application.routes.draw do
  scope "(:locale)", locale: /en|de/ do
    get "/pages/:id" => "high_voltage/pages#show", :as => :page, :format => false
    devise_for :admin_users
    devise_for :users
    root to: "events#index"
    namespace :admin do
      resources :events do
        resources :event_registrations
      end
      resources :registration_overview, only: [:index, :update] do
        collection  do
          get :participants
        end
      end
    end
    resources :events, only: [ :index ]
    resources :event_registrations do
      #post 'preview', on: :collection
      resources :events, :participants, :users
    end

  end
end
