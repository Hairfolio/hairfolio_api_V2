class Conversation < ApplicationRecord
  validates_presence_of :sender

  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  scope :participant, -> (user) { joins(:messages).where(messages: { user: user}) }
  serialize :recipient_ids


  # def self.discover_or_new(params)
  #   sender_id = params[:conversation][:sender_id]
  #   recipient_ids = params[:conversation][:recipient_ids].first
  # end
end
