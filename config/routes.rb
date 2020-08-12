Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get "items/buyers", to: "items#buyers"
  resources :items do
    resources :comments
  end
  resources :users
  resources :user_addresses
  resources :user_profiles
  resources :credit_cards
  resources :categories, only: :index, defaults: { format: 'json' }
end
