# == Schema Information
#
# Table name: communities
#
#  id            :integer          not null, primary key
#  external_link :string
#  logo          :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer          not null
#
# Indexes
#
#  index_communities_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Community do
  let(:user) { FactoryBot.create(:user, :admin) }

  describe 'valid object' do
    subject { FactoryBot.build(:community, user: user) }

    it { expect(subject).to be_valid }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one_attached(:logo) }
  end

  describe 'validations' do
    subject { FactoryBot.create(:community, user: user) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:external_link) }
  end
end
