class Article < ApplicationRecord
  has_one :keywording, as: :keywordable
  has_many :keywords, through: :keywording
  validates :author_name, :title, :description, :body, :cover_image, :keywords, :category, presence: true
end
