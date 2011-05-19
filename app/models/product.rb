class Product < ActiveRecord::Base
  default_scope :order => 'name'
  has_many :line_items, :dependent => :destroy
  has_many :orders, :through => :line_items
  belongs_to :category
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :category_id, :on => :create, :message => "can't be blank"

  
  #paperclip
 has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "400x400>",
      :tiny => "80x80>"
    }
end
