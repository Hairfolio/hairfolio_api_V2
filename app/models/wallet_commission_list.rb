class WalletCommissionList < ApplicationRecord
  belongs_to :order_detail
  belongs_to :user

  def self.commission_percentage
    GlobalVar.find_by(name: 'commission_percentage')&.value&.to_i || 20
  end

  def self.log_commission_percentage
    GlobalVar.find_by(name: 'log_commission_percentage')&.value&.to_i || 20
  end
end
