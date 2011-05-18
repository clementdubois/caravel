class AddCategoryIdToReference < ActiveRecord::Migration
  def self.up
    add_column :references, :category_id, :integer
  end

  def self.down
    remove_column :references, :category_id
  end
end
