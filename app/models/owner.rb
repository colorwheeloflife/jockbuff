class Owner < ApplicationRecord
    belongs_to :league
    has_many :players, :through => :player_passports
    has_many :player_passports
end
