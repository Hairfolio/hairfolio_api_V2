module Payments
  class CreationService
    attr_accessor :order, :card
    def initialize(order: ,card: )
      @order = order
      @card = card
    end

    def call
      StripeIntegrator::Charge.new(user: order.user, card: card, amount: order.amount,
                                   options: { description: "Payment for order #{order.order_number}" })
                              .create
    end
  end
end