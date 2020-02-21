class Wallet < ApplicationRecord
  belongs_to :user
  def self.wallet_transaction_fee
    GlobalVar.find_by(name: 'wallet_transaction_fee')&.value&.to_i
  end

  def self.wallet_transaction_service_charge
    GlobalVar.find_by(name: 'wallet_transaction_service_charge')&.value&.to_i
  end
end
