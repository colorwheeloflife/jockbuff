class PlayerPassport < ApplicationRecord
  belongs_to :player
  belongs_to :team
  validates :player, uniqueness: { scope: :team }
end
