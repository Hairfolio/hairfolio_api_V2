class Label < ApplicationRecord
  belongs_to :post
  has_many :formulas, dependent: :destroy
  validates_presence_of :tag, :position_top, :position_left
end
