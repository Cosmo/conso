module Api
  class TransactionsController < ApplicationController
    def index
      @transactions = Transaction.all
    end
    
    def create
      @transaction = Transaction.new(
        booking_date:   params[:booking_date],
        shop_name:      params[:shop_name],
        amount_in_cent: params[:amount_in_cent]
      )
      @transaction.save
      head :no_content
    end
  end
end
