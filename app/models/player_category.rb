class PlayerCategory < ApplicationRecord
  belongs_to :league
  validates :league_id, uniqueness: true, presence: true
end
