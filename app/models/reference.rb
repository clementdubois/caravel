class Reference < ActiveRecord::Base
  default_scope :order => 'name'
  # has_many :line_items, :dependent => :destroy
  # has_many :orders, :through => :line_items
  has_many :stocks, :dependent => :destroy
  has_many :filiales, :through => :stocks
  has_many :line_bills
  has_many :bills, :through => :line_bills
  has_many :line_orders
  has_many :orders, :through => :line_orders
  has_many :line_receptions
  has_many :receptions, :through => :line_receptions
  belongs_to :supplier
  
  belongs_to :category
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :category_id, :on => :create, :message => "can't be blank"
  
  after_create :link_stock
  
  scope :bests, where(:best => true)
    
  #paperclip
 has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "400x400>",
      :tiny => "80x80>"
    }
    
  def link_stock
    Filiale.all.each do |filiale|
      Stock.create(:reference_id => id, :filiale_id => filiale.id)
    end
  end
  
  def to_json(options = {})
    {
      :id => id,
      :name => name,
      :price => price
    }.to_json
  end
  
end
