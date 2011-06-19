class AddLineReceptionIdToLineBill < ActiveRecord::Migration
  def self.up
    add_column :line_bills, :line_reception_id, :integer
  end

  def self.down
    remove_column :line_bills, :line_reception_id
  end
end
