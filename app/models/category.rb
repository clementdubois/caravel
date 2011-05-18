class Category < ActiveRecord::Base
  validates_presence_of :nom, :on => :create, :message => "can't be blank"
  has_many :products
end
