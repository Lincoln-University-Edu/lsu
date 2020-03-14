class Event < ApplicationRecord
  belongs_to :entity
  has_one :keywording, as: :keywordable
  has_many :keywords, through: :keywording
  validates :datetime, :name, :description, :location, :price, :external_link, :keywords, presence: true
end
