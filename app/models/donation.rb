# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id         :bigint           not null, primary key
#  amount     :float
#  email      :string
#  name       :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Donation < ApplicationRecord
  include DonationInterface

  # Enum
  enum status: { pending: 0, completed: 1 }

  # Scope
  scope :completed, -> { where(status: :completed) }
  scope :pending, -> { where(status: :pending) }

  # Validations
  validates :name, :email, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 5.0 }
end
