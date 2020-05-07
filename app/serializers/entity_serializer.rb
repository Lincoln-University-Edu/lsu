class EntitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :email, 
             :phone_number, :location, :is_office, 
             :is_organisation, :entity_social_accounts,
             :entity_image
  has_many :users
  has_many :events
end
