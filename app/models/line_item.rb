class LineItem < ActiveRecord::Base
  attr_accessible :reference_id, :cart_id
  
  belongs_to :reference 
  belongs_to :cart
  belongs_to :order
  
  def total_price 
    reference.price * quantity
  end
  
  def reference_name
    return reference.name
  end
end
