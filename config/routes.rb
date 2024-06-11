Rails.application.routes.draw do
  resources :vehicles do
    resources :owners, only: [:index, :create]
    resources :accident_reports, only: [:index, :create]
    resources :service_records, only: [:index, :create]
  end
  resources :owners, only: [:show, :update, :destroy]
  resources :accident_reports, only: [:show, :update, :destroy]
  resources :service_records, only: [:show, :update, :destroy]
  resources :users
  resources :sessions, only: [:create, :destroy]

  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/me', to: 'users#show'
end
