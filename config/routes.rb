Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "pages#home"


  devise_for :users, controllers: { registrations: "registrations" }

  resources :users do
    resources :collaborations, only: [:index]
  end

resources :collaborations do
  collection do
    get 'category/:category', to: 'collaborations#category', as: 'category'
  end
  resources :submissions, only: :create
end

get 'search', to: 'search#index', as: 'search'

  resources :submissions, only: [:index, :update, :destroy]
  # the accept/reject submission buttons are on the submissions index page
  # :destroy is not first priority

  namespace :brand do
    resources :submissions, only: :index
  end

  # priority #2 for later
  # resources :users, only: :show do
  #   collection do
  #     get :influencers
  #     get :brands
  #   end
  # end
end
