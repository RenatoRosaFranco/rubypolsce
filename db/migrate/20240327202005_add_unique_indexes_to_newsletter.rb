# frozen_string_literal: true

class AddUniqueIndexesToNewsletter < ActiveRecord::Migration[7.1]
  def change
    add_index :newsletters, :email, unique: true
    add_index :newsletters, :token, unique: true, where: 'token IS NOT NULL'
  end
end
