Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'static_pages#index'

  resources :moisture_reports, only: [:index, :show]

  namespace :api do
    resources :moisture_reports, only: [:index, :show]
    get '/moisture' => 'moisture#show'
  end
end
