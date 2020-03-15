class StudentWire < ApplicationRecord
  has_many :keywordings, as: :keywordable, dependent: :destroy
  has_many :keywords, through: :keywordings
  validates :contact, :title, :body, :cover_image, :external_link, :keywords, presence: true
end
