class MahjongGame < ApplicationRecord
  belongs_to :east
  belongs_to :south
  belongs_to :west
  belongs_to :north
  belongs_to :match_id
end
