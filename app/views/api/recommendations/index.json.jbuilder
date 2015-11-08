json.recommendations do
  json.array! @recommendations do |recommendation|
    json.id               recommendation.id.to_s
    json.name             recommendation.name
    json.price_in_cent    recommendation.price_in_cent
    json.url              recommendation.url
    json.like             (rand(2) == 0)
    json.photo_url        recommendation.photo_url
    json.offer            recommendation.offer
    if recommendation.shop
      json.shop do
        json.id             recommendation.shop.id.to_s
        json.name           recommendation.shop.name
      end
    end
  end
end
