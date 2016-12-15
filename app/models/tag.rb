class Tag < ApplicationRecord
  validates_presence_of :name
  has_many :labels
  has_many :photos, through: :labels
  before_save :parameterize_name
  scope :popular, -> { joins(:labels).group("labels.tag_id").order("count(labels.tag_id) desc") }
  scope :popular_today, -> { joins(:labels).group("labels.tag_id").order("count(labels.tag_id) desc").where("labels.created_at >= ? and labels.created_at <= ?", Time.now - 24.hours, Time.now) }
  scope :popular_last_48_hours, -> { joins(:labels).group("labels.tag_id").order("count(labels.tag_id) desc").where("labels.created_at >= ? and labels.created_at <= ?", Time.now - 48.hours, Time.now) }
  scope :popular_last_7_days, -> { joins(:labels).group("labels.tag_id").order("count(labels.tag_id) desc").where("labels.created_at >= ? and labels.created_at <= ?", Time.now - 7.days, Time.now) }
  scope :popular_last_30_days, -> { joins(:labels).group("labels.tag_id").order("count(labels.tag_id) desc").where("labels.created_at >= ? and labels.created_at <= ?", Time.now - 30.days, Time.now) }

  def parameterize_name
    self.name = self.name.parameterize
  end
end
