# frozen_string_literal: true

class AddUniqueIndexToCommunitiesName < ActiveRecord::Migration[7.1]
  def change
    add_index :communities, :name, unique: true
  end
end
