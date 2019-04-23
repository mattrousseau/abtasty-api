Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :clients, only: [ :index, :create ]
      resources :user_clients, only: [ :index, :create, :destroy ]
      resources :tasks, only: [ :index, :create, :destroy ]
      resources :users, only: [:create]
    end
  end
end
