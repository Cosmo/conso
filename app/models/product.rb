class Product
  include Mongoid::Document
  field :name,      type: String
  field :price,     type: String
  field :photo,     type: String
  field :shop,      type: String
  field :url,       type: String
end