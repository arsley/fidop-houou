# == Schema Information
#
# Table name: mahjong_jansous
#
#  id             :uuid             not null, primary key
#  address        :string
#  google_map_url :string
#  name           :string
#  note           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Jansou < ApplicationRecord
end
