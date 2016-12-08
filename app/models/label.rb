class Label < ApplicationRecord
  belongs_to :tag
  belongs_to :post
  validates_presence_of :tag, :position_top, :position_left
end
