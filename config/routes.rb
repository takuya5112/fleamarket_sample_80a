Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    resources :comments
  end
  resources :users
  resources :user_addresses
  resources :user_profiles
  resources :credit_cards
end
