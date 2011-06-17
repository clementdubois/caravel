class AddSupplierIdToReferences < ActiveRecord::Migration
  def self.up
    add_column :references, :supplier_id, :integer
  end

  def self.down
    remove_column :references, :supplier_id
  end
end
