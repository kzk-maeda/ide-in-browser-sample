Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users

  root 'rooms#index'

  resources :rooms, only: %i[show]
end
