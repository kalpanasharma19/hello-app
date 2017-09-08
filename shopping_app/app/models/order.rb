class Order < ApplicationRecord
  belongs_to :customer
  has_one :delivery_address, inverse_of: :order

  validates_associated :delivery_address
end
