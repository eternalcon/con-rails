Rails.application.routes.draw do
  resources :registrations, only: [:new, :create]
  resources :freeforms, only: [:index]
  resources :freeform_registrations, only: [:new, :create]

  namespace :admin do
    resources :events do
      resources :participants
      resources :registrations
      resources :prices
    end
  end

  get '/registrations/no_available', to: 'registrations#not_available', as: :registration_not_available

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
