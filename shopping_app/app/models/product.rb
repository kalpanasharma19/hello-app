class Product < ApplicationRecord
  #belongs_to :order_item
  has_many :shopping_cart_items
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
