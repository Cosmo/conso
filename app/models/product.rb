class Product
  include Mongoid::Document
  field :name,          type: String
  field :price_in_cent, type: Integer
  field :photo_url,     type: String
  field :shop,          type: String
  field :url,           type: String
  field :offer,         type: Boolean
  belongs_to :shop
  has_many :transactions
end