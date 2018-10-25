class Folio < ApplicationRecord
  belongs_to :user
  validates_presence_of :user, :name
  has_and_belongs_to_many :posts, -> { distinct }
  before_save :update_total_posts

  private

  def update_total_posts
    self.total_posts = posts.length
  end
end
