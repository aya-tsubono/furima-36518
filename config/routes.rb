Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: 'items#index' 

  resources :items
  resources :buying_histories, only: [:index, :new, :create]
end
