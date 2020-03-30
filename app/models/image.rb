class Image < ApplicationRecord
  has_many :imagings, dependent: :destroy
  has_many :imageables, through: :imagings
  validates :url, presence: true
end
