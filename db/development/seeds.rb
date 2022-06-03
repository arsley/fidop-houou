require 'database_cleaner/active_record'

DatabaseCleaner.clean_with(:truncation)

ActiveRecord::Base.transaction do
  members = []
  4.times do |i|
    members << Member.create!(name: "Tonpu#{i}")
  end

  match = MahjongMatch.create!(name: 'Tonpu')

  MahjongGame.create!(
    east: members.first,
    south: members[1],
    west: members[2],
    north: members[3],
    east_score: 10000,
    south_score: 10000,
    west_score: 10000,
    north_score: 10000,
    mahjong_match: match
  )

  members = []
  3.times do |i|
    members << Member.create!(name: "Sanma#{i}")
  end

  match = MahjongMatch.create!(name: 'Sanma')

  MahjongGame.create!(
    east: members[0],
    south: members[1],
    west: members[2],
    north: nil,
    east_score: 10000,
    south_score: 10000,
    west_score: 10000,
    north_score: nil,
    mahjong_match: match
  )
end
