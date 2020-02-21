class Color < ApplicationRecord
  belongs_to :harmony
  has_many :treatments, dependent: :destroy
  validates_presence_of :code, :start_hex, :end_hex

  validates :start_hex, length: { is: 6 }
  validates :start_hex, format: { with: /\A[a-f0-9]+\z/ }
  validates :end_hex, length: { is: 6 }
  validates :end_hex, format: { with: /\A[a-f0-9]+\z/ }

end
