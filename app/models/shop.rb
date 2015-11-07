class Shop
  include Mongoid::Document
  field :name,            type: String
  field :url,             type: String
  field :photo_url, type: String
end