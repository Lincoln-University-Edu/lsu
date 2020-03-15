class Keyword < ApplicationRecord
  has_many :keywordings, dependent: :destroy
  has_many :keywordables, through: :keywordings
  validates :name, presence: true
end