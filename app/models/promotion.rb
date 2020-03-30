class Promotion < ApplicationRecord
  belongs_to :user
  has_one :categorizing, as: :categorizable
  has_one :category, through: :categorizing, dependent: :destroy
  has_many :keywordings, as: :keywordable, dependent: :destroy
  has_many :keywords, through: :keywordings
  has_many :images, as: :imageable, dependent: :destroy

  validates :title, :description, :email, :phone_number, :price, :promotion_category, :condition, presence: true

  def promotion_category=(category)
    self.category = Category.where(name: category).first_or_create!
  end

  def promotion_category
    if self.category
      self.category.name
    end
  end

  def promotion_image_urls=(urls)
    self.images = urls.each do |url|
      Image.where(url: url).first_or_create!
    end
  end

  def promotion_image_urls
    if self.images
      self.images.map(&:name)
    end
  end
end
