class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :charge_id, :order_number, :payment_status, :shipping_status, :amount
  belongs_to :address
  has_many :order_details
  has_one :payment_transaction
end
