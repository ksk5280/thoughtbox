Rails.application.routes.draw do
  root 'welcome#index'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :index, :create]
  resources :links, only: [:index, :create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :links, only: [:index, :show]
    end
  end
end
