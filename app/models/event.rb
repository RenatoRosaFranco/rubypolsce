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
class Event < ApplicationRecord
  # Uploader
  has_one_attached :thumbnail

  # Association
  belongs_to :user

  # Validations
  validates :title, :description, :link, presence: true
  validates :title, uniqueness: true

  # Methods
  def thumbnail_url
    nil
  end
end
