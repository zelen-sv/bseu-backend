Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root :to => "bids#index"
    resources :bids
    resources :users
    resources :faculties
    resources :specialties do
      post :duplicate, on: :member
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :bids, only: [:create]
    resources :specialties, only: [:index]
  end
end
