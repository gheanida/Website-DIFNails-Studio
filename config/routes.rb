Rails.application.routes.draw do
  devise_for :admin_users, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout' }

  root to: 'home#index'
  resources :services, only: [:index, :show]

  get '/bookings/history', to: 'bookings#history', as: :history_bookings
  get '/bookings/new_time', to: 'bookings#new_time', as: :new_time_bookings
  resources :bookings, only: [:index, :new, :create, :show]

  namespace :admin do
    root to: 'dashboard#index'
    get 'dashboard', to: 'dashboard#index'
    resources :services
    resources :transactions
    resources :bookings
    get 'queue', to: 'queue#index'
    resources :customers, only: [:index, :show]
    get 'settings', to: 'settings#index', as: :settings
    patch 'settings/profile', to: 'settings#update_profile', as: :update_profile_settings
    patch 'settings/hours', to: 'settings#update_hours', as: :update_hours_settings
  end
end