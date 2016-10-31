class League < ApplicationRecord
    belongs_to :user
    has_many :teams
    has_many :player_passports
    has_one :player_category
    validates :user_id , presence: true

end

