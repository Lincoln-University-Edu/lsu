class PromotionSerializer < ActiveModel::Serializer
  attributes  :title, :description,:email, :phone_number,:price, :promotion_category, :condition 
  has_many :keywords
  has_one :category
  belongs_to :user
end
