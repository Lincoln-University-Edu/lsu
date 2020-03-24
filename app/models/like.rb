class Like < ApplicationRecord
  has_one :liking
  has_one :likeable, through: :likings
end
