class AddSomeFieldsToProductsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :weight, :decimal
    add_column :products, :expiration_days, :integer
    add_column :products, :composition, :text
  end
end
