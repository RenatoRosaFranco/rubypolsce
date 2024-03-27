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
#  index_communities_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :community do
    logo { nil }
    name { "PLRUG" }
    external_link { "https://plrug.pl" }
    association :user
  end
end
