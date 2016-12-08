class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :contacts
  validates_presence_of :user, :description
  has_and_belongs_to_many :folios, -> { distinct }
  has_and_belongs_to_many :tags, -> { distinct }
  has_many :likes, dependent: :destroy
  scope :popular, -> { where('created_at > ?', 7.days.ago).order('likes_count desc') }
end
