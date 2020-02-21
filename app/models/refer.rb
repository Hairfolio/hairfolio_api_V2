class Refer < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :note
  has_many :refer_histories, dependent: :destroy
  has_many :order_unique_codes, dependent: :destroy
end
