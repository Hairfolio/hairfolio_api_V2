class WalletPaymentTransactionHistorySerializer < ActiveModel::Serializer
  attributes :id, :amount,:transaction_id,:currency,:bank_account_id,:charges_amount,:status,:account_type,:created_at,:total_amount

  
  def amount
    "%.2f" % object.amount
  end

  def charges_amount
    "%.2f" % object.charges_amount
  end

  def total_amount
    "%.2f" % (object.amount.to_f + object.charges_amount.to_f).round(2)
  end

end
