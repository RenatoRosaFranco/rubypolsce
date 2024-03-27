# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id         :bigint           not null, primary key
#  amount     :float
#  email      :string
#  name       :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :donation do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    amount { rand(100..1000).to_f }
    status { 'pending' }

    trait :completed do
      after(:create) do |donation, _evaluator|
        donation.update(status: 'completed')
      end
    end
  end
end
