Rails.application.routes.draw do
  get "home/index"
  devise_for :admin_users, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout' }
  devise_for :customers, path: 'account', path_names: { sign_in: 'login', sign_out: 'logout' }

  root to: 'home#index'
  resources :services, only: [:index, :show]

  get "home/index"

  namespace :admin do
    root to: 'dashboard#index'
    get 'dashboard', to: 'dashboard#index'
    resources :services
    resources :transactions
    resources :bookings
    resources :customers, only: [:index, :show]
    resources :settings, only: [:index, :update]
  end

  namespace :customer do
    root to: 'bookings#index'
    resources :bookings, only: [:index, :new, :create, :show]
    resource :profile, only: [:show, :edit, :update]
  end
end