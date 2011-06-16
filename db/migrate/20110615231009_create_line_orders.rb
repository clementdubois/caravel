class CreateLineOrders < ActiveRecord::Migration
  def self.up
    create_table :line_orders do |t|
      t.integer :order_id
      t.integer :reference_id
      t.integer :quantity
      t.integer :total

      t.timestamps
    end
  end

  def self.down
    drop_table :line_orders
  end
end
