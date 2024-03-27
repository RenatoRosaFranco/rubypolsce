# frozen_string_literal: true

class AddColumnUserIdToCommunities < ActiveRecord::Migration[7.1]
  def change
    add_reference :communities, :user, null: false, foreign_key: true
  end
end
