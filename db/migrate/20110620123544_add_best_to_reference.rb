class AddBestToReference < ActiveRecord::Migration
  def self.up
    add_column :references, :best, :boolean, :default => false
  end

  def self.down
    remove_column :references, :best
  end
end
