# frozen_string_literal: true

class CreateDonations < ActiveRecord::Migration[7.1]
  def change
    create_table :donations do |t|
      t.string   :name
      t.string   :email
      t.float    :amount
      t.integer  :status

      t.timestamps
    end
  end
end
