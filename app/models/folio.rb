class Folio < ApplicationRecord
  belongs_to :user
  validates_presence_of :user, :name
  has_and_belongs_to_many :post, -> { distinct }
end
