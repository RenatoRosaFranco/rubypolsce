# frozen_string_literal: true

# == Schema Information
#
# Table name: newsletters
#
#  id         :integer          not null, primary key
#  active     :boolean
#  email      :string
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Newsletter < ApplicationRecord
  # Attributes
  after_create :signup

  # validations
  validates :email, presence: true, uniqueness: true
  validates :token, uniqueness: true, allow_blank: true

  # Methods
  def signup
    transaction { update(token: SecureRandom.hex(8), active:true) }
  end

  def cancel
    transaction { update(token: nil, active: false) }
  end
end
