class PlayerPassport < ApplicationRecord
  belongs_to :league
  belongs_to :player
  belongs_to :team
  validates :player, uniqueness: { scope: :league }
end
