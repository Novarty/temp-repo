class AddCommentsToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :comment, :text
  end
end
