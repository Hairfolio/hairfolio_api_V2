class Order < ApplicationRecord
	belongs_to :user
	belongs_to :address
	has_many :order_details
	enum payment_status: [:awaiting, :paid, :cancel]
	enum shipping_status: [:pending, :progress, :delivered]	
end
