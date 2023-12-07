Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"

  root to: "products#index"
  resources :products, only: [:destroy], as: :delete_products
  resources :products, except: [:destroy] do
    resources :bookmarks, only: [:new, :create] #maybe destroy?
    
  end
  resources :bookings, only: [:new, :create, :destroy, :edit, :index]
  
  
  resources :users, only: [:index] do
    resources :reviews, only: [:new, :create]
    resources :bookmarks, only: [:index]
    resources :bookmarks, only: [:destroy], as: :delete_bookmarks
  end
end
