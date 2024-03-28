# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  description :text
#  link        :string
#  thumbnail   :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_events_on_title    (title) UNIQUE
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Event do
  subject { create(:event) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:link) }
  end

  describe '#thumbnail_url' do
    subject(:event) { create(:event) }

    context 'when thumbnail is not attached' do
      it 'returns nil' do
        expect(event.thumbnail_url).to be_nil
      end
    end
  end
end
