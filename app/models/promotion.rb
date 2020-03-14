class Promotion < ApplicationRecord
  belongs_to :user
  validates :title, :description, :email, :phone_number, :price, :category, :condition, presence: true
end
