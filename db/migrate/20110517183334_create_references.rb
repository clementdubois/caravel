class CreateReferences < ActiveRecord::Migration
  def self.up
    create_table :references do |t|
      t.string :name
      t.text :description
      t.integer :price, :default => 0
      t.string :status, :default => "en attente de validation"
      t.integer :country_id
      t.integer :category_id
      t.string :photo_file_name   
      t.integer :photo_file_size   
      t.string :photo_content_type

      t.timestamps
    end
  end

  def self.down
    drop_table :references
  end
end
