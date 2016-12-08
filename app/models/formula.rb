class Formula < ApplicationRecord
  belongs_to :post
  belongs_to :service
  validates_presence_of :service, :time, :weight, :volume
  has_many :teatments
  has_many :colors, through: :treatments
  accepts_nested_attributes_for :teatments, allow_destroy: true
end
