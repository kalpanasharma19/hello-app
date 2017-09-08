class ShoppingCartItem < ApplicationRecord
  belongs_to :customer
  has_one :product
  validates_associated :product
end
