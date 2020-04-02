class Entity < ApplicationRecord
  validates :name, :description, :email, :phone_number, :location, presence: true
  validates :name
  has_many :organizations, dependent: :destroy
  has_many :users, through: :organizations
  has_many :events
end
