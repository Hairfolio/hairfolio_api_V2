class Service < ApplicationRecord
  validates_presence_of :name
  has_and_belongs_to_many :brands
  has_many :formulas, dependent: :destroy
  has_many :offerings, dependent: :destroy

end
