module Orders
  class CreationService
    attr_accessor :current_user, :address_params, :payment_params, :order, :payment
    def initialize(current_user: , address_params:, payment_params:)
      @current_user = current_user
      @address_params = address_params
      @payment_params = payment_params
    end

    def call
      ActiveRecord::Base.transaction do
        create_order_and_order_details
        create_payment
        create_transaction
        order
      end
    end

    private

    def create_order_and_order_details
      raise Errors::CartEmptyError if current_user.carts.empty?
      @order =
        current_user.orders.create!(payment_status: 'awaiting', order_number: "Ord#{DateTime.now.strftime("%Y%m%d%H%M")}",
                                    shipping_status: 'pending', address_id: address_params[:address_id])
      price = 0
      cart_data = current_user.carts
      cart_data.each do |cart|
        current_quantity = cart.product.quantity
        raise Errors::QuantityExceedError if current_quantity < cart.quantity
        cart.product.update!(quantity: current_quantity - cart.quantity)
        order.order_details.create!( product_id: cart.product_id,
                                     quantity: cart.quantity,
                                     price: cart.product.price*cart.quantity)
        price += (cart.product.price * cart.quantity)
        cart.destroy!
      end
      order.update!(amount: price.to_i)
      order
    end

    def create_payment
      card = current_user.cards.find(payment_params[:card_id])
      @payment = Payments::CreationService.new(order: order, card: card).call
    end

    def create_transaction
      order.create_payment_transaction!(amount: order.amount.to_i, user_id: current_user.id,
                                        stripe_charge_id: payment['id'], transaction_type: :debit)
    end
  end
end