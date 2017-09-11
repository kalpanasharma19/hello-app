class ChangeDeliveryAddressesColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :delivery_addresses, :phone_number, :text
  end
end
