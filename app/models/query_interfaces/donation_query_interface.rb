# frozen_string_literal: true

module DonationQueryInterface
  extend ActiveSupport::Concern

  class_methods do
    def today
      completed.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    end

    def this_week
      completed.where(created_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)
    end

    def this_month
      completed.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
    end
  end
end