class Player < ApplicationRecord
  self.primary_key = 'player_key'
  has_many :owners,:through => :player_passports
  has_many :player_passports
end
