class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :charge_id, :order_number, :payment_status,
             :shipping_status, :amount, :wallet_amount, :coupon_amount, :final_amount,
             :created_at, :discount
  belongs_to :address
  has_many :order_details
  has_one :payment_transaction

  #this added on 25-05-19
  def discount
    descount_price = 0
    object.order_details.each do |cart|
      descount_price += cart.discount
    end
    return descount_price
  end

  def final_amount
    final_amount_price = 0
    object.order_details.each do |cart|
      final_amount_price += cart.discount
    end
    final_amount2 = (object.amount - (final_amount_price + object.wallet_amount + object.coupon_amount))
    return final_amount2
  end

  def created_at
    object.created_at.iso8601
  end
end
