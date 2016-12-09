class Tag < ApplicationRecord
  validates_presence_of :name
  has_many :labels
  has_many :posts, through: :labels
  before_save :parameterize_name

  def parameterize_name
    self.name = self.name.parameterize
  end
end
