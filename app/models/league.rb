class League < ApplicationRecord
  belongs_to :user
  has_many :teams
  validates :user_id , presence: true
end

