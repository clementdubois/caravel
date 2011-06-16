class CreateReceptions < ActiveRecord::Migration
  def self.up
    create_table :receptions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :receptions
  end
end
