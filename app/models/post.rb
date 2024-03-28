# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  tags       :string
#  thumbnail  :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_title    (title) UNIQUE
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  # Uploader
  has_one_attached :thumbnail

  # Associations
  belongs_to :user

  # Validations
  validates :title, :content, :tags, presence: true
  validates :title, uniqueness: true
end
