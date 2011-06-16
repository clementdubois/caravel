class CreateLineReceptions < ActiveRecord::Migration
  def self.up
    create_table :line_receptions do |t|
      t.integer :reference_id
      t.integer :reception_id
      t.integer :line_order_id
      t.integer :received_quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :line_receptions
  end
end
