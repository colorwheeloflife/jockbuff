class Player < ApplicationRecord
  self.primary_key = 'player_id'
  has_many :teams,:through => :player_passports
  has_many :player_passports
  has_many :player_predictions
  validates :positions, presence: true
end
