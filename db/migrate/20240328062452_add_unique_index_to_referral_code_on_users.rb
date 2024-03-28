# frozen_string_literal: true

class AddUniqueIndexToReferralCodeOnUsers < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :referral_code, unique: true
  end
end
