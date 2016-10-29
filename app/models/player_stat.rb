class PlayerStat < ApplicationRecord
  belongs_to :player
  has_many :player_passports,:through => :players
end
