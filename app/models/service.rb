class Service < ApplicationRecord
  validates_presence_of :name, :brand
  belongs_to :brand
end
