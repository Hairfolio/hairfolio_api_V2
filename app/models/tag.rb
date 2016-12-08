class Tag < ApplicationRecord
  validates_presence_of :name
  has_many :labels
  has_many :posts, through: :labels
end
