class RenameReferenceToProduct < ActiveRecord::Migration
  def self.up
      rename_table :references, :products
  end

  def self.down
    rename_table :products, :references
  end
end
