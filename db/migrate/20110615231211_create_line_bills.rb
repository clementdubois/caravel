class CreateLineBills < ActiveRecord::Migration
  def self.up
    create_table :line_bills do |t|
      t.integer :reference_id
      t.integer :bill_id
      t.integer :quantity
      t.integer :total

      t.timestamps
    end
  end

  def self.down
    drop_table :line_bills
  end
end
