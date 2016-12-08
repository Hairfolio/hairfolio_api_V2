class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :contacts
  validates_presence_of :user, :description
  has_and_belongs_to_many :folios, -> { distinct }
  has_many :likes, dependent: :destroy
end
