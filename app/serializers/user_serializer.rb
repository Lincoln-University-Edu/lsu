class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :all_majors
  has_many :majors 
  has_many :entities
  has_many :promotions
end
