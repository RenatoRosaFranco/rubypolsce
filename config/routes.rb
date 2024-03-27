# frozen_string_literal: true

Rails.application.routes.draw do

  # Dashboard
  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'

  # Authentication
  devise_for :users

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Application
  root "home#index"
  get 'analytics' => 'donations#analytics'
  resources :donations, only: [:index, :create]
  resources :newsletters, only: [:create, :destroy], param: :token
end
