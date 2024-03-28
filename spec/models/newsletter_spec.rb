# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Newsletter do
  subject { described_class.new(email: email) }

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