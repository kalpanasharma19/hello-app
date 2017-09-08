class AddColumnToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :salt, :string
  end
end
