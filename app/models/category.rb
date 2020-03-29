class Category < ApplicationRecord
  validates :name, presence: true
  has_many :categorizings
  has_many :categorizables, through: :categorizings
end
