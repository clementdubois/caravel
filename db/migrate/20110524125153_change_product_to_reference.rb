class ChangeProductToReference < ActiveRecord::Migration
  def self.up
    rename_table :products, :references
  end
  
  def self.down
      rename_table :references, :products
  end
end
