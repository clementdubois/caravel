class LineReception < ActiveRecord::Base
  belongs_to :reception
  belongs_to :reference
  belongs_to :line_order
  accepts_nested_attributes_for :line_order
  has_one :line_bill
  
  before_save :update_stock
  
  def reference_name
    return reference.name
  end
  
  def quantity
    return line_order.quantity
  end
    
  def update_stock
    stock = reference.stocks.find_by_filiale_id(filiale.id)
    stock.quantity += received_quantity
    stock.save!
  end
  
  def filiale
    reception.order.filiale
  end
end
