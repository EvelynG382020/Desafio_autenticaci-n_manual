Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :stories
  resources :users, only: [:new, :create, :show]
  root 'stories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
