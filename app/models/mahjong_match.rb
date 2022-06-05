class MahjongMatch < ApplicationRecord
  has_many :mahjong_games, dependent: :destroy
end
