class Api::V1::CardsController < ApplicationController
  before_action :authenticate_with_token!
  before_action :set_card, only: %i[make_primary destroy]

  def index
    result = fetch_cards(limit: params[:limit], starting_after: params[:starting_after])
    success(data: result, status: 200)
  end

  def create
    Payments::AddCardService.new(user: @current_user, token: params[:stripe_token]).call
    success(data: { meassage: "Card created successfully" })
  end

  def destroy
    return invalid_parameters(message: I18n.t('errors.primary_card')) if @card.is_primary
    StripeIntegrator::Card.new(user: @current_user).delete_card(@card.stripe_card_id)
    @card.destroy!
    success(data: { message: 'Deleted Successfully' }, status: 200)
  end

  def make_primary
    ActiveRecord::Base.transaction do
      @current_user.cards.update_all(is_primary: false)
      @card.update(is_primary: true)
    end
    success(data: { message: 'Updated Successfully' }, status: 200)
  end

  private

  def set_card
    @card = @current_user.cards.find(params[:id])
  end

  def fetch_cards(limit: nil, starting_after: nil)
    cards_array = []
    cards = StripeIntegrator::Card.new(user: @current_user).list_cards(limit: limit, starting_after: starting_after)
    return {} unless cards.present?
    @cards = @current_user.cards
    cards['data'].each do |card_data|
      card = @cards.find_by(stripe_card_id: card_data['id'])
      card_number = '*' * 12 + card_data['last4']
      card_hash = { id: card.id, is_primary: card.is_primary, card_number: card_number,
                    exp_month: card_data['exp_month'], exp_year: card_data['exp_year'],
                    brand: card_data['brand']}
      cards_array << card_hash
    end
    { cards: cards_array, has_more: cards['has_more'] }
  end
end