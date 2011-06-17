class AddStatusToStocks < ActiveRecord::Migration
  def self.up
    add_column :stocks, :status, :string, :default => "en attente"
  end

  def self.down
    remove_column :stocks, :status
  end
end
