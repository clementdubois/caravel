class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.string  :receiver_type
      t.string :state, :default => "en attente de validation"

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
