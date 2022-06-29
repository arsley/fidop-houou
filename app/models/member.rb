# == Schema Information
#
# Table name: members
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  discord_id :string
#
class Member < ApplicationRecord
  self.implicit_order_column = 'created_at'
end
