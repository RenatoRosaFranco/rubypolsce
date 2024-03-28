# frozen_string_literal: true

module Types
  class PostType < BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :content, String, null: false
    field :tags, String, null: false
    field :thumbnail_url, String, null: true, method: :thumbnail_url
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, UserType, null: false

    def thumbnail_url
      nil if object.thumbnail.attached?
    end
  end
end
