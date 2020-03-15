class Entity < ApplicationRecord
  validates :name, :description, :email, :phone_number, :location, presence: true
  has_many :organisations, dependent: :destroy
  has_many :users, through: :organisations
  has_many :events
end
