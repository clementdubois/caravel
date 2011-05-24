class ChangeProductIdToReferenceId < ActiveRecord::Migration
  def self.up
    rename_column :line_items, :product_id, :reference_id
  end

  def self.down
    rename_column :line_items, :reference_id, :product_id
  end
end
