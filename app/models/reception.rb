class Reception < ActiveRecord::Base
  has_many :line_receptions, :dependent => :destroy
  belongs_to :order
  accepts_nested_attributes_for :line_receptions
  belongs_to :filiale
  has_one :bill
  
  after_save :update_order
  after_save :generate_bill
  
  
  def update_order
    order.some_reception
  end
  
  def generate_bill
    b = build_bill({:order_id => order.id})
    line_receptions.each do |lr|
      lb = b.line_bills.build({:reference_id => lr.reference_id,
                                :quantity => lr.received_quantity,
                                :total => (lr.reference.price * lr.received_quantity),
                                :line_reception_id => lr.id})
    end
    totaux = 0
    b.total = b.line_bills.map {|lb| totaux += lb.total}.first
    b.save!
  end
  
end
