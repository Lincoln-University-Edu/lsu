class Category < ApplicationRecord
  has_many :categorizings
  has_many :categorizables, through: :categorizings
end
