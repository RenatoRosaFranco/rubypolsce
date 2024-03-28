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
require 'rails_helper'

RSpec.describe Newsletter do
  subject { described_class.new(email: 'hanzok@gmail.com') }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to allow_value('').for(:token) }
  end

  context 'when creating multiple newsletters' do
    before { create(:newsletter, email: 'unique@example.com', token: 'unique1234') }

    it { is_expected.to validate_uniqueness_of(:token).allow_blank }
  end
end
