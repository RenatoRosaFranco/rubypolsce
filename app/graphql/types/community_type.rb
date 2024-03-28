# frozen_string_literal: true

module Types
  class CommunityType < Types::BaseObject
    field :id, ID, null: false
    field :external_link, String, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :logo_url, String, null: true, method: :logo_url
    field :user, Types::UserType, null: false
  end
end
