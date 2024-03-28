# frozen_string_literal: true

module Types
  class DonationType < Types::BaseObject
    field :id, ID, null: false
    field :amount, Float, null: false
    field :email, String, null: false
    field :name, String, null: false
    field :status, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def status
      object.status.humanize
    end
  end
end
