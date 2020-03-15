class Major < ApplicationRecord
  has_many :majorings
  has_many :users, through: :majorings
end
