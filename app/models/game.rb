# == Schema Information
#
# Table name: games
#
#  id          :bigint           not null, primary key
#  east_score  :integer          not null
#  north_score :integer
#  south_score :integer          not null
#  west_score  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  east_id     :uuid             not null
#  match_id    :bigint           not null
#  north_id    :uuid
#  south_id    :uuid             not null
#  west_id     :uuid             not null
#
# Indexes
#
#  index_games_on_east_id   (east_id)
#  index_games_on_match_id  (match_id)
#  index_games_on_north_id  (north_id)
#  index_games_on_south_id  (south_id)
#  index_games_on_west_id   (west_id)
#
# Foreign Keys
#
#  fk_rails_...  (east_id => members.id)
#  fk_rails_...  (match_id => matches.id)
#  fk_rails_...  (north_id => members.id)
#  fk_rails_...  (south_id => members.id)
#  fk_rails_...  (west_id => members.id)
#
class Game < ApplicationRecord
  belongs_to :east,  nil, class_name: 'Member'
  belongs_to :south, nil, class_name: 'Member'
  belongs_to :west,  nil, class_name: 'Member'
  belongs_to :north, nil, class_name: 'Member', optional: true
  belongs_to :match
end
