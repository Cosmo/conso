class Transaction
  include Mongoid::Document
  field :amount_in_cent, type: Integer
  field :shop_name, type: String
  belongs_to :shop
  belongs_to :product
  belongs_to :user
end
