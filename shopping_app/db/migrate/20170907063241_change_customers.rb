class ChangeCustomers < ActiveRecord::Migration[5.1]
  def change
    change_column :customers, :phone_number, :text
  end
end
