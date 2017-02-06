class Harmony < ApplicationRecord
  belongs_to :line
  validates_presence_of :line, :name
  has_many :colors

  def ordered_colors
    hash = colors.map { |c|
      {
        id: c.id,
        code: c.code,
        first_digit_or_number: c.code.split(/^([a-zA-Z]{1,}|\d{1,}\.\d{1,}|\d{1,})/).first,
        last_digit_or_number: c.code.split(/([a-zA-Z]{1,}|\d{1,}\.\d{1,}|\d{1,})$/).first
      }
    }
    
  end
end
