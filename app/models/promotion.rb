class Promotion < ApplicationRecord
  belongs_to :user
  has_many :keywordings, as: :keywordable, dependent: :destroy
  has_many :keywords, through: :keywordings
  validates :title, :description, :email, :phone_number, :price, :category, :condition, presence: true
end
