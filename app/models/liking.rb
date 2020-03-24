class Liking < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :like
end
