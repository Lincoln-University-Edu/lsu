class Keywordings < ApplicationRecord
  belongs_to :keywordable, polymorphic: true
  belongs_to :keyword
end