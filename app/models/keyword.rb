class Keyword < ApplicationRecord
  has_many :keywordings
  validates :name, presence: true
end