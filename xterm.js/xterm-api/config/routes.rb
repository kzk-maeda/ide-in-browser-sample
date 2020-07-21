Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  mount ActionCable.server => '/socket'
end
