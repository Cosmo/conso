json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :amount_in_cent, :shop_name, :shop_id, :product_id, :user_id
  json.url transaction_url(transaction, format: :json)
end
