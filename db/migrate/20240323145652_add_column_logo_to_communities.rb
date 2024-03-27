# frozen_string_literal: true

class AddColumnLogoToCommunities < ActiveRecord::Migration[7.1]
  def change
    add_column :communities, :logo, :string
  end
end
