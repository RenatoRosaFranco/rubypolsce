# frozen_string_literal: true

class AddUniqueIndexToPostsTitle < ActiveRecord::Migration[7.1]
  def change
    add_index :posts, :title, unique: true
  end
end
