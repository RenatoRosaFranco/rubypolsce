# frozen_string_literal: true

class AddColumnAdminToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
0