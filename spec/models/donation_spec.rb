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
require 'rails_helper'

RSpec.describe Donation do
  describe 'valid object' do
    subject(:donation) { build(:donation) }

    it { expect(donation).to be_valid }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than_or_equal_to(5.0) }
  end

  describe 'enum status' do
    it { is_expected.to define_enum_for(:status).with_values(%i[pending completed]) }
  end

  describe 'scopes' do
    let!(:pending_donations) { create(:donation) }
    let!(:completed_donations) { create(:donation, :completed) }

    it 'returns completed donations', :aggregate_failures do
      expect(described_class.completed).to include(completed_donations)
      expect(described_class.completed).not_to include(pending_donations)
    end

    it 'returns pending donations', :aggregate_failures do
      expect(described_class.pending).to include(pending_donations)
      expect(described_class.pending).not_to include(completed_donations)
    end
  end
end
