class Product < ApplicationRecord
  belongs_to :tag
  validates_presence_of :name, :tag
end
