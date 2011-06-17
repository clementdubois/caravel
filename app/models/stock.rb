class Stock < ActiveRecord::Base
  belongs_to :reference
  belongs_to :filiale
  
  scope :accepted, :conditions => {:status => "valide"}
  
  def reference_name
    return reference.name
  end
end
