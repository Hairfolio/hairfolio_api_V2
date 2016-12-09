class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :contacts
  validates_presence_of :user, :description
  has_and_belongs_to_many :folios, -> { distinct }
  has_many :labels, dependent: :destroy
  has_many :tags, through: :labels
  has_many :formulas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :formulas, allow_destroy: true
  accepts_nested_attributes_for :labels, allow_destroy: true
  scope :popular, -> { where('created_at > ?', 7.days.ago).order('likes_count desc') }
end
