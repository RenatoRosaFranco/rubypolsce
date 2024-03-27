# frozen_string_literal: true

RSpec::Matchers.define :be_valid_password do |expected|
  match do |actual|
    actual.valid_password?(expected)
  end
end
