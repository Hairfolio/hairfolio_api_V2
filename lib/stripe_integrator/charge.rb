require_relative './base'

module StripeIntegrator
  class Charge
    attr_accessor :customer, :card
    def initialize(user: ,card: )
      @customer = user
      @card = card
    end

    def create
      response =
        Stripe::Charge.create({
                                  amount: 2000,
                                  currency: 'usd',
                                  source: @card.stripe_card_id,
                                  description: 'Charge for Test',
                                  customer: @customer.stripe_customer_id
                              })
      puts response
    end
  end
end