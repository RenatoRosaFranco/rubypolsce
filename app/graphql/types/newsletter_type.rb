# frozen_string_literal: true

module Types
  class NewsletterType < BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :token, String, null: true
    field :active, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
