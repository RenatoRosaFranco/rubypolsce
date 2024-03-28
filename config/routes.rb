# frozen_string_literal: true

Rails.application.routes.draw do

  # GraphQL Engine
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?

  # Admin
  # https://admin.rubypolsce.pl
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Authentication
  # https://auth.rubypolsce.pl
  devise_for :users

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Application
  # https://rubypolsce.pl
  scope "(:locale)", locale: /en|pl/ do
    root "home#index"
    get 'analytics' => 'donations#analytics'
    resources :donations, only: [:index, :create]
    resources :newsletters, only: [:create, :destroy], param: :token
  end

  # Dashboard
  # https://dashboard.rubypolsce.pl
  namespace :dashboard do
    scope "(:locale)", locale: /en|pl/ do
      get '/', to: 'home#index'
    end
  end

  # API
  # https://rubypolsce.pl/graphql
  post "/graphql", to: "graphql#execute"
end
