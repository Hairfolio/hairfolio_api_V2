class Line < ApplicationRecord
  belongs_to :brand
  has_many :formulas, dependent: :destroy
  has_many :harmonies, dependent: :destroy

  validates_presence_of :name, :brand, :unit
  enum unit: [:g, :oz]
end
