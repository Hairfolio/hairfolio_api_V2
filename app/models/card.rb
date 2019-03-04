class Card < ApplicationRecord

  before_create :save_as_primary, unless: :user_has_primary_card?

  private

  def user_has_primary_card?
    self.user.primary_card.present?
  end

  def save_as_primary
    self.is_primary = true
  end
end
