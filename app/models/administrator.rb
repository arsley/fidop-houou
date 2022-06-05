class Administrator < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 8 }
  validates :userid, presence: true
end
