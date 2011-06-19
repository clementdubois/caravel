class AddReceivedBillQuantityToLineReception < ActiveRecord::Migration
  def self.up
    add_column :line_receptions, :received_bill_quantity, :integer
  end

  def self.down
    remove_column :line_receptions, :received_bill_quantity
  end
end
