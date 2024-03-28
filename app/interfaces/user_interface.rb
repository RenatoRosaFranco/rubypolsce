# frozen_string_literal: true

module UserInterface
  extend ActiveSupport::Concern

  included do
    before_create :set_referral_code
  end

  def set_referral_code
    self.referral_code = SecureRandom.hex(8)
  end
end
