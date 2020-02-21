class Api::V1::WalletPaymentTransactionHistoriesController < ApplicationController
	before_action :authenticate_with_token!, only: [:index]

	def index
		wallet_payment_transactions = current_user.wallet_payment_transaction_histories
		wallet_payment_transactions = wallet_payment_transactions.page(params[:page]).per(params[:limit])

    
		render json: wallet_payment_transactions,  meta:pagination_dict(wallet_payment_transactions), status: 200
	end
end