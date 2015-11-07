json.products do
  json.array! @products do |product|
    json.id               product.id.to_s
    json.name             product.name
    json.price_in_cent    product.price_in_cent
    json.url              product.url
    json.photo_url        product.photo_url
    json.offer            product.offer
    if product.shop
      json.shop do
        json.id             product.shop.id.to_s
        json.name           product.shop.name
      end
    end
  end
end
