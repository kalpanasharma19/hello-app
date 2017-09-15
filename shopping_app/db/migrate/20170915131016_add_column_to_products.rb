class AddColumnToProducts < ActiveRecord::Migration[5.1]
  def self.up
    add_column :products, :stock_quantity, :integer
  end

  def self.down
    remove_column :products, :stock_quantity, :integer
  end
end
