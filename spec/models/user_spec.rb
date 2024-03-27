# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User do
  subject(:user) { create(:user, password: 'test123', password_confirmation: 'test123') }

  describe 'associations' do
    it { is_expected.to have_many(:communities).dependent(:destroy) }
  end

  describe 'devise' do
    it 'is database authenticatable' do
      expect(user).to be_valid_password('test123')
    end

    it 'is rememberable' do
      expect(user).to respond_to(:send_reset_password_instructions)
    end

    it 'is validatable' do
      user = build(:user, email: 'invalid', password: 'short', password_confirmation: 'short')
      expect(user).not_to be_valid
    end
  end
end
