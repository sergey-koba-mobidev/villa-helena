Rails.application.routes.draw do
  root "home#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :bookings, only: [:create]

  get '/api/backup', to: 'backups#create'
end
