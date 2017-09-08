class DeliveryAddress < ApplicationRecord
  belongs_to :customer
  validates :phone_number, presence: true, length: {minimum: 10}
end
