class Promotion < ApplicationRecord
  belongs_to :user
  has_one :categorizing, as: :categorizable
  has_one :category, through: :categorizing, dependent: :destroy
  has_many :keywordings, as: :keywordable, dependent: :destroy
  has_many :keywords, through: :keywordings
  validates :title, :description, :email, :phone_number, :price, :promotion_category, :condition, presence: true

  def promotion_category=(category)
    self.category = Category.where(name: category).first_or_create!
  end

  def promotion_category
    if self.category
      self.category.name
    end
  end
end
