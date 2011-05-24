class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  
  def add_reference(reference_id) 
    current_item = line_items.find_by_reference_id(reference_id) 
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:reference_id => reference_id)
    end
    current_item
  end
  
  def total_price 
    line_items.to_a.sum { |item| item.total_price }
  end
  
  def total_items 
    line_items.sum(:quantity)
  end
end