class Entity < ApplicationRecord
  validates :name, :description, :email, :phone_number, :location, presence: true
end
