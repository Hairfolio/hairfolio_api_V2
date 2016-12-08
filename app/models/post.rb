class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :contacts
  validates_presence_of :user, :description
  has_and_belongs_to_many :folios, -> { distinct }
  has_and_belongs_to_many :tags, -> { distinct }
  has_many :formulas
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :formulas, allow_destroy: true
  scope :popular, -> { where('created_at > ?', 7.days.ago).order('likes_count desc') }
end
