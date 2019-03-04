require_relative './base'

module StripeIntegrator
  class Account
    attr_accessor :user
    def initialize(user)
      @user = user
    end

    def create
      response =
        Stripe::Account::create({
                                type: 'standard',
                                email: user.email
                                })
      (response['object'] == 'account') ? response['id'] : nil
    end
  end
end