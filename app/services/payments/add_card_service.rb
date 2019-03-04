module Payments
  class AddCardService
    attr_accessor :user, :card_token
    def initialize(user: , token: )
      @user = user
      @card_token = token
    end

    def call
      if user.stripe_customer_id
        create_card
      else
        create_stripe_customer
      end
    end

    private

    def create_stripe_customer
      ActiveRecord::Base.transaction do
        customer = StripeIntegrator::Customer.new(user: user, token: token).create
        user.update!(stripe_customer_id: customer[:id])
        if customer[:cards]
          customer[:cards].each { |i| user.cards.create!(stripe_card_id: i) }
        end
      end
    end

    def create_card
      ActiveRecord::Base.transaction do
        card = StripeIntegrator::Card.new(customer_id: user.stripe_customer_id)
                                     .create(token: token)
        user.cards.create!(stripe_card_id: card)
      end
    end
  end
end