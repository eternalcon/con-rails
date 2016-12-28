Rails.application.routes.draw do
  resources :participants
  resources :registrations
  #get 'participants/new'

  #get 'participants/create'

  #get 'participants/show'

  namespace :admin do
    resources :events do
      resources :participants
      resources :prices
    end
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
