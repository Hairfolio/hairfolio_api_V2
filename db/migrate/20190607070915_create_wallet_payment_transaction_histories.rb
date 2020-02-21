class CreateWalletPaymentTransactionHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :wallet_payment_transaction_histories do |t|
      t.references :user, foreign_key: true
      t.string :amount
      t.string :transaction_id
      t.string :currency
      t.string :bank_account_id
      t.string :charges_amount
      t.string :status
      t.string :account_type

      t.timestamps
    end
  end
end