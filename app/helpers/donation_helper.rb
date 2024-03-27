# frozen_string_literal: true

module DonationHelper
  def self.sanitize_status(status)
    case status
    when 'completed'
      'Completed'
    when 'pending'
      'Pending'
    end
  end
end