# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string   :title
      t.string   :thumbnail
      t.text     :description
      t.string   :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
