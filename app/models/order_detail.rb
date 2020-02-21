class OrderDetail < ApplicationRecord
	belongs_to :order
	belongs_to :product, -> { with_deleted }
	has_many :wallet_commission_lists, dependent: :destroy
end
