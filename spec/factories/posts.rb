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

def safe_image_url(url)
  # rubocop:disable Security/Open
  URI.open(url)
  # rubocop:enable Security/Open
rescue StandardError => e
  Rails.logger.error "Failed to open URI: #{e}"
  nil
end

FactoryBot.define do
  factory :post do
    thumbnail { nil }
    title { FFaker::Book.title }
    content { FFaker::Lorem.paragraphs(rand(4..6)).join }
    tags { FFaker::Tweet.tags }
    user

    after(:create) do |post, _evaluator|
      post.thumbnail.attach(
        io: safe_image_url(FFaker::Image.url),
        filename: "thumbnail#{post.id}.jpg",
        content_type: 'image/jpg'
      )
    rescue OpenURI::HTTPError => e
      puts "Failed to attach thumbnail from : #{e.message}"
    end
  end
end
