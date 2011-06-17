class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.integer :reference_id
      t.integer :cart_id
      t.integer :quantity, :default => 0
      t.integer :order_id
      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
