class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :name
      t.string :adress

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
