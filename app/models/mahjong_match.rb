# == Schema Information
#
# Table name: mahjong_matches
#
#  id                :bigint           not null, primary key
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  mahjong_jansou_id :uuid             not null
#
# Indexes
#
#  index_mahjong_matches_on_mahjong_jansou_id  (mahjong_jansou_id)
#
# Foreign Keys
#
#  fk_rails_...  (mahjong_jansou_id => mahjong_jansous.id)
#
class MahjongMatch < ApplicationRecord
  has_many :mahjong_games, dependent: :destroy
  belongs_to :mahjong_jansou
end
