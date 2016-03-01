Rails.application.routes.draw do
  root to: "home#index"
  resources :users

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/links', to: 'static#main'
  resources :links, only: [:show, :update]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :links
    end
  end


end
