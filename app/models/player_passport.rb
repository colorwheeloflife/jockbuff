class PlayerPassport < ApplicationRecord
  belongs_to :league
  belongs_to :player
  belongs_to :team
  has_many :player_predictions,:through => :players
  validates :player, uniqueness: { scope: :league }
end
