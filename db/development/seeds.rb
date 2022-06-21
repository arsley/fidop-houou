require 'database_cleaner/active_record'

DatabaseCleaner.clean_with(:truncation)

ActiveRecord::Base.transaction do
  Administrator.create!(userid: 'testuser', password: 'password', password_confirmation: 'password')

  m1 = Member.create!(name: 'Member1')
  m2 = Member.create!(name: 'Member2')
  m3 = Member.create!(name: 'Member3')
  m4 = Member.create!(name: 'Member4')
  m5 = Member.create!(name: 'Member5')
  m6 = Member.create!(name: 'Member6')

  j1 = MahjongJansou.create!(name: 'Member1 sou')
  j2 = MahjongJansou.create!(name: 'Member2 sou')

  match = MahjongMatch.create!(name: '5/6', mahjong_jansou: j1)
  MahjongGame.create!(east: m1, south: m3, west: m5, north: m4, east_score: 36_600, south_score: 2600,
                      west_score: 42_700, north_score: 18_900, mahjong_match: match)
  MahjongGame.create!(east: m1, south: m3, west: m4, north: m2, east_score: 18_200, south_score: 10_300,
                      west_score: 40_000, north_score: 31_500, mahjong_match: match)
  MahjongGame.create!(east: m1, south: m3, west: m5, north: m2, east_score: 41_700, south_score: 22_300,
                      west_score: 17_300, north_score: 18_700, mahjong_match: match)
  MahjongGame.create!(east: m3, south: m5, west: m4, north: m2, east_score: 22_000, south_score: 32_100,
                      west_score: 25_900, north_score: 20_000, mahjong_match: match)
  MahjongGame.create!(east: m1, south: m5, west: m4, north: m2, east_score: 38_300, south_score: 30_200,
                      west_score: 10_000, north_score: 21_500, mahjong_match: match)

  match = MahjongMatch.create(name: '5/21', mahjong_jansou: j1)
  MahjongGame.create!(east: m1, south: m5, west: m3, north: m4, east_score: 14_700, south_score: 37_900,
                      west_score: 32_700, north_score: 14_700, mahjong_match: match)
  MahjongGame.create!(east: m1, south: m3, west: m6, north: m4, east_score: 11_500, south_score: 28_800,
                      west_score: 49_300, north_score: 10_400, mahjong_match: match)
  MahjongGame.create!(east: m1, south: m5, west: m6, north: m4, east_score: 33_100, south_score: 20_000,
                      west_score: 46_900, north_score: 10_000, mahjong_match: match)
  MahjongGame.create!(east: m5, south: m3, west: m6, north: m4, east_score: 28_800, south_score: 16_000,
                      west_score: 20_100, north_score: 35_100, mahjong_match: match)
  MahjongGame.create!(east: m1, south: m5, west: m3, north: m6, east_score: 14_700, south_score: 15_600,
                      west_score: 26_300, north_score: 43_400, mahjong_match: match)

  match = MahjongMatch.create(name: '5/28', mahjong_jansou: j2)
  MahjongGame.create!(east: m3, south: m5, west: m1, north: nil, east_score: 37_000, south_score: 44_000,
                      west_score: 24_000, north_score: nil, mahjong_match: match)
  MahjongGame.create!(east: m3, south: m5, west: m1, north: m4, east_score: 31_900, south_score: 36_100,
                      west_score: 18_000, north_score: 14_000, mahjong_match: match)
  MahjongGame.create!(east: m3, south: m5, west: m1, north: m4, east_score: 15_600, south_score: 19_200,
                      west_score: 17_000, north_score: 48_200, mahjong_match: match)

  match = MahjongMatch.create(name: '5/31', mahjong_jansou: j2)
  MahjongGame.create!(east: m3, south: m5, west: m4, north: m6, east_score: 32_900, south_score: 32_700,
                      west_score: 21_000, north_score: 5300, mahjong_match: match)

  match = MahjongMatch.create(name: '6/4', mahjong_jansou: j1)
  MahjongGame.create!(east: m3, south: m5, west: m1, north: nil, east_score: 43_000, south_score: 26_000,
                      west_score: 36_000, north_score: nil, mahjong_match: match)
  MahjongGame.create!(east: m3, south: m5, west: m1, north: nil, east_score: 93_000, south_score: 3000,
                      west_score: 9000, north_score: nil, mahjong_match: match)

  at = AccessToken.create!
  puts 'token on development:'
  puts "\t#{at.to_jwt}"
end
