Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Defines the root path route ("/")
  # root "posts#index"
  devise_for :users
  resources :brands, only: [:show, :edit, :update, :destroy]
  resources :influencers, only: [:show, :edit, :update, :destroy]
  
  resources :collaborations, only: [:index, :new, :create, :show] do
    resources :submissions
  end
  
  resources :submissions, only: [:index, :edit, :update, :destroy]
  
  namespace :brand do
    resources :collaborations do
      resources :submissions, only: :index
    end
  end

  root to: "pages#home"
end
