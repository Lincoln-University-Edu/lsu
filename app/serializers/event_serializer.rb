class EventSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :name, 
             :description, :location, :price, 
             :external_link, :event_keywords, 
             :entity_id, :event_category, :event_social_accounts

  has_one :entity
end
