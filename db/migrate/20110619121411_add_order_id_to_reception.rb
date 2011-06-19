class AddOrderIdToReception < ActiveRecord::Migration
  def self.up
    add_column :receptions, :order_id, :integer
  end

  def self.down
    remove_column :receptions, :order_id
  end
end
