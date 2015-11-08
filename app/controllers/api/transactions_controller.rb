module Api
  class TransactionsController < ApplicationController
    def index
      @transactions = Transaction.all.reverse
    end
    
    def create
      @transaction = Transaction.new(
        booking_date:   params[:booking_date],
        shop_name:      params[:shop_name],
        amount_in_cent: params[:amount_in_cent]
      )
      @transaction.save
      puts "Saving transaction"
      puts @transaction.errors
      head :no_content
    end
  end
end
