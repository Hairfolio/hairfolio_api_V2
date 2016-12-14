class Photo < ApplicationRecord
  belongs_to :post
  has_many :labels, dependent: :destroy
  has_many :tags, through: :labels
  has_many :formulas, dependent: :destroy
  accepts_nested_attributes_for :formulas, allow_destroy: true

  validates_presence_of :asset_url
end
