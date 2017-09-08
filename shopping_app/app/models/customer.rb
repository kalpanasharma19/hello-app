class Customer < ApplicationRecord
attr_accessor :password, :password_confirmation

  has_many :delivery_addresses
  has_one :order
  has_many :shopping_cart_items

  validates_associated :delivery_addresses
  validates_associated :order
  validates_associated :shopping_cart_items

  validates :name, presence: true
  validates :phone_number, presence: true, length: {minimum: 10}
  validates :password, confirmation: true, length: {minimum: 6}

  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save :encrypt_password
  after_save :clear_password
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end
  def clear_password
    self.password = nil
  end


  def self.authenticate(username="", login_password="")
      customer = Customer.find_by_name(username)
    if customer && customer.match_password(login_password)
      return customer
    else
      return false
    end
  end
  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

end
