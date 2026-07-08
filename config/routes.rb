Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  authenticated :user do
    root to: "dashboard#show", as: :authenticated_root
    resources :employees
    resources :client_users

    resources :posts, path: 'servicios'
  end

  devise_scope :user do
    root to: "users/sessions#new"
  end

  resource :dashboard, only: [:show], controller: :dashboard
end
