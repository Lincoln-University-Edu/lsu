class Keyword < ApplicationRecord
  has_many :keywordings, dependent: :destroy
  validates :name, presence: true
end