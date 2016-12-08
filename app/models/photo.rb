class Photo < ApplicationRecord
  belongs_to :post
  has_many :formulas
  validates_presence_of :asset_url
end
