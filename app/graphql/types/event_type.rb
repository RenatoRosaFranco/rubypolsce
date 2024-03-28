# frozen_string_literal: true

module Types
  class EventType < BaseObject
    field :id, ID, null: false
    field :thumbnail, String, null: true
    field :title, String, null: false
    field :description, String, null: false
    field :link, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, Types::UserType, null: false

    def thumbnail
      object.thumbnail_url if object.thumbnail.present?
    end
  end
end
