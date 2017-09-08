class Product < ApplicationRecord
  #belongs_to :order_item
  #belongs_to :shopping_cart_item
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
