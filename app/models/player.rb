class Player < ApplicationRecord
  self.primary_key = 'player_id'
  has_many :teams,:through => :player_passports
  has_many :player_passports
  has_one :player_prediction
  has_one :goalie_prediction
  validates :positions, presence: true
end
