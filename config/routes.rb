Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'dashboard#index'

  resources :dashboard, only: [:index]

  resources :moisture_reports, only: [:index, :show]

  namespace :api do
    resources :moisture_reports, only: [:index, :show]
    get '/temperature' => 'temperature#show'
    get '/pressure' => 'pressure#show'
    get '/air_humidity' => 'air_humidity#show'
    resources :moisture, only: [:index]
  end
end
