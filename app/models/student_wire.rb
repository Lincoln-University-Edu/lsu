class StudentWire < ApplicationRecord
  has_one :keywording, as: :keywordable
  has_many :keywords, through: :keywording
  validates :contact, :title, :body, :cover_image, :external_link, :keywords, presence: true
end
