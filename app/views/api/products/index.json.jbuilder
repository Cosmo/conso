json.products do
  json.array! @products do |product|
    json.id               product.id.to_s
    json.name             product.name
    json.url              product.url
  end
end
