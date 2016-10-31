class PlayerPrediction < ApplicationRecord
    self.primary_key = 'player_id'
    belongs_to :player
    has_many :player_passports,:through => :player
    validates :player_id, presence: true
end
