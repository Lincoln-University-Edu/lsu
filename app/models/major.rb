class Major < ApplicationRecord
  validates :name, presence: true
  has_many :majorings, dependent: :destroy
  has_many :students, through: :majorings, class_name: "User"
end
