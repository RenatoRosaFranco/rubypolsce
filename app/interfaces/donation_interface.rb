# frozen_string_literal: true

module DonationInterface
  extend ActiveSupport::Concern
  include ::DonationQueryInterface

  included do
    before_create :set_donation_status
  end

  def set_donation_status
    self.status = 'pending'
  end

  def change_donation_status(new_status)
    update(status: new_status)
  end

  class_methods do
    def latest
      order(created_at: :desc)
    end

    def total_donated_at_day
      today.sum(&:amount)
    end

    def total_donated_at_week
      this_week.sum(&:amount)
    end

    def total_donated_at_month
      this_month.sum(&:amount)
    end

    def total_donated
      completed.sum(:amount)
    end
  end
end
