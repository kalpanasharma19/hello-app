class Product < ApplicationRecord
  has_many :order_items
  has_many :shopping_cart_items

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
