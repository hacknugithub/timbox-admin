Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }

  authenticated :user do
    root to: "dashboard#show", as: :authenticated_root
    resources :employees
    resources :client_users

    resources :posts, path: 'servicios'
    resource :account_settings, only: [:edit, :update]
    resources :algorithms, only: [:index]
  end

  devise_scope :user do
    root to: "users/sessions#new"
  end

  resource :dashboard, only: [:show], controller: :dashboard
end
