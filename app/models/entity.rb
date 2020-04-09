class Entity < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name

  validates :name, :description, :email, :phone_number, :location, presence: true
  has_many :organizations, dependent: :destroy
  has_many :users, through: :organizations
  has_many :events
end
