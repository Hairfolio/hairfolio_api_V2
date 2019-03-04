require_relative './base'

module StripeIntegrator
  class Card
    attr_accessor :customer_id
    def initialize(customer_id:)
      @customer_id = customer_id
    end

    def create(token: )
      response =
        Stripe::Customer.create_source(
                            customer_id,
                            { source: token }
        )
      response['object'] == 'card' ? response['id'] : nil
    end
  end

  def retrive_card(card_id)
    customer = Stripe::Customer.retrieve(customer_id)
    card = customer.sources.retrieve(card_id)
    card['object'] == 'card' ? card :  nil
  end

  def delete_card(card_id)
    Stripe::Customer.delete_source(
        customer_id,
        card_id
    )
  end

  def list_cards(limit: nil, starting_after: nil)
    options = { object: 'card' }
    options.merge!({ limit: limit}) if limit
    options.merge!({ starting_after: starting_after}) if starting_after
    Stripe::Customer.list_sources(
        customer_id,
        options
    )
  end
end