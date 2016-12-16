class Conversation < ApplicationRecord
  validates_presence_of :sender

  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  scope :participant, -> (user) { joins(:messages).where(messages: { user: user}) }
  serialize :recipient_ids

  scope :including_all_ids, -> (ids) { where(matching_ids_query(ids, 'AND')) }

  def self.discover_or_new(params)
    Conversation.including_all_ids(params[:conversation][:recipient_ids]).where(sender_id: params[:conversation][:sender_id]).first_or_initialize
  end

  private

  def self.matching_ids_query(ids, condition_separator = 'OR')
    ids.map { |id| "(recipient_ids LIKE '%#{id}%')" }.join(" #{condition_separator} ")
  end
end
