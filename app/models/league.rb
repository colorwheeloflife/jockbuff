class League < ApplicationRecord
    belongs_to :user
    has_many :teams
    has_many :player_passports
    has_one :player_category
    has_one :goalie_category
    validates :user_id , presence: true

end

