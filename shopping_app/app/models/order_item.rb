class OrderItem < ApplicationRecord
  belongs_to :order
  has_one :product, inverse_of: :order_item

  validates_associated :product
end
