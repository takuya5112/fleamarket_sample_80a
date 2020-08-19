Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :comments
    collection do
      get "delete_done"
    end
    member do
      get "buyers"
    end
  end
  resources :users
  resources :user_addresses
  resources :user_profiles
  resources :credit_cards
  resources :categories, only: :index, defaults: { format: 'json' }
end
