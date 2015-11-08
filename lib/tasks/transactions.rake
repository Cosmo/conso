require 'rubygems'
require 'json'
require 'net/http'
require 'uri'

namespace :transactions do
  task :parse_transactions => :environment do
    source = "https://ucg-apimanager.axwaycloud.net:8065/transactions/v1"
    uri = URI.parse(source)
    http = Net::HTTP.new(uri.host, uri.port)

    req = Net::HTTP::Get.new(uri.path, initheader = {'KeyId' =>'081a2723-8e92-428a-a018-97420f6927b4'})

    http.use_ssl = true
    resp = http.request(req)
    data = resp.body
    result = JSON.parse(data)
    #User.find_by(id:1).current_balance_in_cent = result['transactionHeader']['availableBalance'] * (100)
    result['transactions'].each do |transaction|
      if ['DomesticPayment','BancomatPOS','Payment'].include?transaction['type']
        puts transaction
        transaction_id = transaction['transactionID']
        amount_in_cent = transaction['amount'] * 100
        shop_name = transaction['description']
        booking_date = transaction['bookingDate']

        Transaction.where(transaction_id:transaction_id, 
                     amount_in_cent:amount_in_cent, 
                     shop_name:shop_name, 
                     booking_date:booking_date).first_or_create
      end
    end
  end

  task :rename_shop_name => :environment do
    Transaction.all.each do |transaction|
      if transaction.shop_name
        matcha = transaction.shop_name.match(/Ben: ([a-zA-Z0-9\.\s]+)\sns/)
        if matcha
          transaction.shop_name = matcha[1]
          transaction.save
          puts transaction.shop_name
        end
      end
    end
  end
end
