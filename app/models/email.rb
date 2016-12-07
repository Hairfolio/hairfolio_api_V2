class Email < ApplicationRecord
  belongs_to :contact
  validates_presence_of :email, :email_type
  enum email_type: [:work, :home]
end
