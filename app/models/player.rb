class Player < ApplicationRecord
  self.primary_key = 'player_id'
  has_many :owners,:through => :player_passports
  has_many :player_passports
  validates :positions, presence: true

end
