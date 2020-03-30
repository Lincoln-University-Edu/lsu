class Imaging < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :image
end
