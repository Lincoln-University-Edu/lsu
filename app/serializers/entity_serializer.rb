class EntitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :email, :phone_number, :location, :is_office, :is_organisation
  has_many :users
  has_many :events
end
