Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :comments
    collection do
      get "delete_done"
      get "credit_card"
    end
    member do
      get "buyers"
      post "buy"
    end
  end
  resources :users
  resources :user_addresses
  resources :user_profiles
  resources :credit_cards
  resources :categories, only: :index, defaults: { format: 'json' }
end
