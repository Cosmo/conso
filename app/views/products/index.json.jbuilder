json.array!(@products) do |product|
  json.extract! product, :id, :name, :price_in_cent, :photo_url, :url, :offer, :shop_id
  json.url product_url(product, format: :json)
end
