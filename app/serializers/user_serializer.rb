class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :all_majors, :user_keywords, :user_entities
  has_many :majors 
  has_many :entities
  has_many :promotions
end
