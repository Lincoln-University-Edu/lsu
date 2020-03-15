class Entity < ApplicationRecord
  validates :name, :description, :email, :phone_number, :location, presence: true
  has_many :organisations
  has_many :users, through: :organisations
end
