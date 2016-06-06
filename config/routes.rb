Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :index, :create]
  resources :links, only: :index

end
