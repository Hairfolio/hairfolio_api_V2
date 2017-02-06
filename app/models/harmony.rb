class Harmony < ApplicationRecord
  belongs_to :line
  validates_presence_of :line, :name
  has_many :colors

  def ordered_colors
    
  end
end
