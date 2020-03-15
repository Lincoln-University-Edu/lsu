class Article < ApplicationRecord
  has_many :keywording, as: :keywordable, dependent: :destroy
  has_many :keywords, through: :keywording
  validates :author_name, :title, :description, :body, :cover_image, :keywords, :category, presence: true
end
