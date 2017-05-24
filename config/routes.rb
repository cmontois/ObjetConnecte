Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'dashboard#index'

  resources :dashboard, only: [:index]

  resources :reports, only: [:index, :show]

  namespace :api do
    resources :sensors, only: [:index]
    resources :reports, only: [:index]
  end
end
