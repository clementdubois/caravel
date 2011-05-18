class Reference < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :category_id, :on => :create, :message => "can't be blank"
  belongs_to :category
end
