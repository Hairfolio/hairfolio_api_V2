class Tag < ApplicationRecord
  validates_presence_of :name
  has_many :labels
  has_many :posts, through: :labels
  before_save :parameterize_name
  # scope :popular_today, -> { joins(:post_item_tags).where("post_item_tags.created_at >= ? and post_item_tags.created_at <= ?", Time.now - 24.hours, Time.now).order("count(post_item_tags.hastag_id) desc")  }
  # scope("Popular Today") { |scope| scope.joins(:post_item_tags).where("post_item_tags.created_at >= ? and post_item_tags.created_at <= ?", Time.now - 24.hours, Time.now).order("count(post_item_tags.hastag_id) desc") }
# scope("Popular Past 48 Hours") { |scope| scope.joins(:post_item_tags).where("post_item_tags.created_at >= ? and post_item_tags.created_at <= ?", Time.now - 48.hours, Time.now).order("count(post_item_tags.hastag_id) desc") }
# scope("Popular Past 7 Days") { |scope| scope.joins(:post_item_tags).where("post_item_tags.created_at >= ? and post_item_tags.created_at <= ?", Time.now - 7.days, Time.now).order("count(post_item_tags.hastag_id) desc") }
# scope("Popular Past 30 Days") { |scope| scope.joins(:post_item_tags).where("post_item_tags.created_at >= ? and post_item_tags.created_at <= ?", Time.now - 30.days, Time.now).order("count(post_item_tags.hastag_id) desc") }

  def parameterize_name
    self.name = self.name.parameterize
  end
end
