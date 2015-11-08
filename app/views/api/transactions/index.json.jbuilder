json.transactions do
  json.array! @transactions do |transaction|
    json.id               transaction.id.to_s
    json.shop_name        transaction.shop_name
    json.amount_in_cent   transaction.amount_in_cent
    json.booking_date     transaction.booking_date
    json.transaction_id   transaction.transaction_id
    if transaction.shop
      json.shop do
        json.id             transaction.shop.id.to_s
        json.name           transaction.shop.name
      end
    end
    
    if transaction.product
      json.product do
        json.id               transaction.product.id.to_s
        json.name             transaction.product.name
        json.price_in_cent    transaction.product.price_in_cent
        json.url              transaction.product.url
        json.photo_url        transaction.product.photo_url
        json.offer            transaction.product.offer
      end
    end
    
    if transaction.user
      json.user do
        json.id             transaction.user.id.to_s
        json.name           transaction.user.name
      end
    end
  end
end
