# frozen_string_literal: true

module ApplicationHelper
  def to_money(amount, unit = '$')
    number_to_currency(amount, unit: unit)
  end
end
