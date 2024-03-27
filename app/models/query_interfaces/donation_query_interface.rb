# frozen_string_literal: true

module DonationQueryInterface
  extend ActiveSupport::Concern

  class_methods do
    def today
      completed.where(created_at: Time.zone.now.all_day)
    end

    def this_week
      completed.where(created_at: Time.zone.now.all_week)
    end

    def this_month
      completed.where(created_at: Time.zone.now.all_month)
    end
  end
end
