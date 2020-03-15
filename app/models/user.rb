class User < ApplicationRecord
  validates :first_name, :last_name, :email, :user_class,:password, presence: true
  has_secure_password
  has_many :majorings
  has_many :majors, through: :majorings
  has_many :organizations
  has_many :entities, through: :organizations
end
