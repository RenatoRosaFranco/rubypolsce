# frozen_string_literal: true

class AddUniqueIndexToTitleOnEvents < ActiveRecord::Migration[7.1]
  def change
    add_index :events, :title, unique: true
  end
end
