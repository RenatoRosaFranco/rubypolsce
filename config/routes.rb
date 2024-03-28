# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

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
  root "home#index"
  get 'analytics' => 'donations#analytics'
  resources :donations, only: [:index, :create]
  resources :newsletters, only: [:create, :destroy], param: :token

  # Dashboard
  # https://dashboard.rubypolsce.pl
  namespace :dashboard do
    get '', to: 'home#index'
  end

  # API
  # https://api.rubypolsce.pl/
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        # TODO: some json from here
      end
    end

    namespace :v2 do
      defaults format: :xml do
        # TODO: some xml from here
      end
    end
  end
end
