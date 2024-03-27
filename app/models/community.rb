# frozen_string_literal: true

# == Schema Information
#
# Table name: communities
#
#  id            :bigint           not null, primary key
#  external_link :string
#  logo          :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_communities_on_name     (name) UNIQUE
#  index_communities_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Community < ApplicationRecord
  # Uploader
  has_one_attached :logo

  # Associations
  belongs_to :user

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :external_link, presence: true
end
