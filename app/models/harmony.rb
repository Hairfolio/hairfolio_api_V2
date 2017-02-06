class Harmony < ApplicationRecord
  belongs_to :line
  validates_presence_of :line, :name
  has_many :colors

  def ordered_colors
    hash = colors.map { |c|
      {
        id: c.id,
        code: c.code,
        first_digit_or_number: c.code.split(/^([a-zA-Z]{1,}|\d{1,}\.\d{1,}|\d{1,})/).reject { |a| a.empty? }.first,
        last_digit_or_number: c.code.split(/([a-zA-Z]{1,}|\d{1,}\.\d{1,}|\d{1,})$/).reject { |a| a.empty? }.first
      }
    }
    Color.where(id: hash.sort_by { |c| [c[:first_digit_or_number], c[:last_digit_or_number]]}.reverse.map { |a| a[:id] })
  end
end
