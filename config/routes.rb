Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root :to => "bids#index"
    resources :bids
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :bids, only: [:create]
  end
end
