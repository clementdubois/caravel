class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.integer :reference_id
      t.integer :filiale_id
      t.integer :quantity, :default => 0
      t.integer :min_alert, :default => 0
      t.boolean :direct_order, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :stocks
  end
end
