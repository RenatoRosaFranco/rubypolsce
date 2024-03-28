# frozen_string_literal: true

class AddColumnReferralCodeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :referral_code, :string
  end
end
