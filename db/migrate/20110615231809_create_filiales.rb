class CreateFiliales < ActiveRecord::Migration
  def self.up
    create_table :filiales do |t|
      t.string :name
      t.string :adress

      t.timestamps
    end
  end

  def self.down
    drop_table :filiales
  end
end
