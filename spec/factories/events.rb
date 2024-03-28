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
require 'open-uri'

def safe_image_url(url)
  # rubocop:disable Security/Open
  URI.open(url)
  # rubocop:enable Security/Open
rescue StandardError => e
  Rails.logger.error "Failed to open URI: #{e}"
  nil
end

FactoryBot.define do
  factory :event do
    title { FFaker::Book.title }
    description { FFaker::Lorem.paragraphs(rand(1..2)) }
    link { FFaker::Internet.http_url }
    user

    after(:create) do |event, _evaluator|
      event.thumbnail.attach(
        io: safe_image_url(FFaker::Image.url),
        filename: "thumbnail#{event.id}.jpg",
        content_type: 'image/jpg'
      )
    rescue OpenURI::HTTPError => e
      puts "Failed to attach thumbnail from : #{e.message}"
    end
  end
end
