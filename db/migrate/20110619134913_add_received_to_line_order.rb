class AddReceivedToLineOrder < ActiveRecord::Migration
  def self.up
    add_column :line_orders, :received, :integer, :default => 0
  end

  def self.down
    remove_column :line_orders, :received
  end
end
