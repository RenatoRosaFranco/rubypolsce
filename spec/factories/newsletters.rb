# frozen_string_literal: true

# == Schema Information
#
# Table name: newsletters
#
#  id         :bigint           not null, primary key
#  active     :boolean
#  email      :string
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_newsletters_on_email  (email) UNIQUE
#  index_newsletters_on_token  (token) UNIQUE WHERE (token IS NOT NULL)
#
FactoryBot.define do
  factory :newsletter do
    email { FFaker::Internet.email }
    token { SecureRandom.hex(10) }
    active { true }

    trait :cancel do
      token { nil }
      active { false }
    end
  end
end
