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
require 'rails_helper'

RSpec.describe Donation, type: :model do

  describe 'valid object' do
    subject { FactoryBot.build(:donation) }

    it { expect(subject).to be_valid }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(5.0) }
  end

  describe 'enum status' do
    it { should define_enum_for(:status).with_values([:pending, :completed]) }
  end

  describe 'scopes' do
    let!(:pending_donations) { FactoryBot.create(:donation) }
    let!(:completed_donations) { FactoryBot.create(:donation, :completed) }

    it 'returns completed donations' do
      expect(Donation.completed).to include(completed_donations)
      expect(Donation.completed).not_to include(pending_donations)
    end

    it 'returns pending donations' do
      expect(Donation.pending).to include(pending_donations)
      expect(Donation.pending).not_to include(completed_donations)
    end
  end
end
