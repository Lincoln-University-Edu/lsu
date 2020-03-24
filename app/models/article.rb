class Article < ApplicationRecord
  has_many :keywording, as: :keywordable, dependent: :destroy
  has_many :keywords, through: :keywording
  has_one :categorizing, as: :categorizable
  has_one :category, through: :categorizing
  has_many :likings, as: :likeable
  has_many :likes, through: :likings

  validates :author_name, :title, :description, :body, :article_keywords,:cover_image, :category, presence: true

  def article_keywords=(keywords)
    self.keywords = keywords.split(",").map do |keyword|
      Keyword.where(name: keyword).first_or_create!
    end    
  end


  def article_keywords
   self.keywords.map(&:name)
  end
end
