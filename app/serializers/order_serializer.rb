class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :charge_id, :transaction_id, :order_number, :payment_status, :shipping_status
  belongs_to :address
  has_many :order_details
end
