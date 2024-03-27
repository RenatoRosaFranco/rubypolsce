# frozen_string_literal: true

class CreateCommunities < ActiveRecord::Migration[7.1]
  def change
    create_table :communities do |t|
      t.string   :name
      t.string   :external_link

      t.timestamps
    end
  end
end
