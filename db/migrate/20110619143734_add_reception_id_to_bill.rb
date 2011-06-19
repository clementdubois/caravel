class AddReceptionIdToBill < ActiveRecord::Migration
  def self.up
    add_column :bills, :reception_id, :integer
  end

  def self.down
    remove_column :bills, :reception_id
  end
end
