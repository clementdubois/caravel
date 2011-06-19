class LineReception < ActiveRecord::Base
  belongs_to :reception
  belongs_to :reference
  belongs_to :line_order
  accepts_nested_attributes_for :line_order
  has_one :line_bill
  
  def reference_name
    return reference.name
  end
  
  def quantity
    return line_order.quantity
  end
end
