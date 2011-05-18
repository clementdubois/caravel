class AddPhotoToReference < ActiveRecord::Migration
  def self.up
    add_column :references, :photo_file_name, :string
    add_column :references, :photo_file_size, :integer
    add_column :references, :photo_content_type, :string
  end

  def self.down
    remove_column :references, :photo_content_type
    remove_column :references, :photo_file_size
    remove_column :references, :photo_file_name
  end
end
