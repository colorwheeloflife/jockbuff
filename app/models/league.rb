class League < ApplicationRecord
    belongs_to :user
    has_many :owners
end
