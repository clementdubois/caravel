class Product < ActiveRecord::Base
  default_scope :order => 'name'
  has_many :line_items, :dependent => :destroy
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :category_id, :on => :create, :message => "can't be blank"
  belongs_to :category
  
  #paperclip
 has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "400x400>" 
    }
end
