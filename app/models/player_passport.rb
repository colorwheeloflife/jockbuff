class PlayerPassport < ApplicationRecord
  belongs_to :player
  belongs_to :owner
  validates :player, uniqueness { scope: :owner }
end
