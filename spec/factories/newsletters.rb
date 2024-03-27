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
FactoryBot.define do
  factory :newsletter do
    email { FFaker::Internet.email }
    token { SecureRandom.hex(10) }
    status { true }

    trait :cancel do
      token { nil }
      status { false }
    end
  end
end
