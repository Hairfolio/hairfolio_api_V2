class Category < ApplicationRecord
  validates_presence_of :name
  has_and_belongs_to_many :products
  has_many :sub_categories
end
