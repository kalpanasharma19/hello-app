class DeliveryAddress < ApplicationRecord
  belongs_to :customer
  has_many :orders

  validates_associated :orders

  validates :customer_id, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: {minimum: 10}
end
