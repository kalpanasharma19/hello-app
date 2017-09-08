class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :customer_role
      t.string :name
      t.string :encrypted_password
      t.integer :phone_number
      t.string :email

      t.timestamps
    end
  end
end
