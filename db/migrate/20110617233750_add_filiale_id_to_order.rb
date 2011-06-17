class AddFilialeIdToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :filiale_id, :integer
    remove_column :orders, :user_id
  end

  def self.down
    remove_column :orders, :filiale_id
    add_column :orders, :user_id, :integer
  end
end
