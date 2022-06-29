# == Schema Information
#
# Table name: administrators
#
#  id              :uuid             not null, primary key
#  password_digest :string
#  userid          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :administrator do
    userid { Faker::Internet.username }
    password_digest { Faker::Internet.password }
  end
end
