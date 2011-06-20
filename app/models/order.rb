class Order < ActiveRecord::Base
  has_many :line_orders, :dependent => :destroy
  accepts_nested_attributes_for :line_orders, :reject_if => lambda {|a| a[:reference_id].blank?}, :allow_destroy => true
  belongs_to :receiver, :polymorphic => true
  belongs_to :filiale
  
  has_many :receptions
  has_many :bills
  belongs_to :user
  
  scope :wait_validation, :conditions => {:state => "en attente de validation"}
  scope :finished, :conditions => {:state => "terminé"}
  scope :wait_reception, :conditions => {:state => "envoyée"}
  scope :wait_other_receptions, :conditions => {:state => "partiellement reçue"}
  scope :validated, where("state <> 'en attente de validation'")
  scope :from_user, where("filiale_id is null")
  scope :from_filiale, where("filiale_id is not null")
  
  def validated?
    state != "en attente de validation"
  end
  
  def finished?
    state == "terminé"
  end
  
  def part_received?
    sate == "partiellement reçue"
  end
  
  def nothing_received?
    state == "envoyée"
  end
  
  def some_reception
    finished = 1
    
    line_orders.each do |lo|      
      lo.line_receptions.each do |lr|
        lo.received += lr.received_quantity
      end
      lo.save!
      
      if lo.received < lo.quantity && state != "partiellement reçue"
        state = "partiellement reçue"
        finished = 0
        save!
      end
    end
    
    if finished
      state = "terminé" 
      save!
    end
  end
  
  def price
    price = 0
    line_orders.map {|lo| price += lo.total}
    price
  end
  
  def number_of_articles
    total = 0
    line_orders.map {|lo| total += lo.quantity}
    total
  end
  
  # PAYMENT_TYPES = [ "Credit card", "Paypal" ]
  #  
  #  validates :name, :address, :email, :pay_type, :presence => true
  #  validates :pay_type, :inclusion => PAYMENT_TYPES
  #  
  #  def add_line_items_from_cart(cart) 
  #    cart.line_items.each do |item|
  #      item.cart_id = nil
  #      line_items << item
  #    end 
  #  end
end
