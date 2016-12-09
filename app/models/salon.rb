class Salon < ApplicationRecord
  validates_presence_of :name
  has_many :users, dependent: :destroy
  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    "#{address}, #{city}, #{state}, #{zip}"
  end
end
