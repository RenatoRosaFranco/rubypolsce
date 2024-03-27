# frozen_string_literal: true

class CreateNewsletters < ActiveRecord::Migration[7.1]
  def change
    create_table :newsletters do |t|
      t.string   :email
      t.string   :token
      t.boolean  :active

      t.timestamps
    end
  end
end
