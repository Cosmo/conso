class User
  include Mongoid::Document
  field :name, type: String
  field :current_balance_in_cent, type: Integer
  has_many :transactions
end