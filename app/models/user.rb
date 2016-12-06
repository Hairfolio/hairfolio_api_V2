class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  belongs_to :salon

  enum account_type: [:consumer, :stylist, :brand, :owner]

  before_create :generate_authentication_token!

  before_validation :set_default_account_type

  def set_default_account_type
    self.account_type ||= 'consumer'
  end

  def generate_authentication_token!
    loop do
      self.auth_token = Devise.friendly_token
      break unless self.class.exists?(auth_token: auth_token)
    end
  end

  def self.validate_facebook_token(token)
    Koala::Facebook::API.new(token).get_object('me?fields=id,name,first_name,last_name,email,friends')
  rescue
    false
  end

  def self.validate_insta_token(token)
    Instagram.client(access_token: token).user
  rescue
    false
  end
end
