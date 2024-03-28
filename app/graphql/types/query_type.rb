# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: 'Fetches an object given its ID.' do
      argument :id, ID, required: true, description: 'ID of the object.'
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, { null: true }], null: true, description: 'Fetches a list of list of IDs.' do
      argument :ids, [ID], required: true, description: 'IDs of the objects.'
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Fields
    field :users, [UserType], null: false
    field :communities, [CommunityType], null: false
    field :donations, [DonationType], null: false
    field :events, [EventType], null: false
    field :newsletters, [NewsletterType], null: false

    # Methods
    def users
      User.all
    end

    def events
      Event.all
    end

    def communities
      Community.all
    end

    def donations
      Donation.all
    end

    def newsletters
      Newsletter.all
    end
  end
end
