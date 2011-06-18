class Stock < ActiveRecord::Base
  belongs_to :reference
  belongs_to :filiale
  
  scope :accepted, where("status = 'valide'")
  scope :alert, accepted.where("quantity <= min_alert")
  
  def reference_name
    return reference.name
  end
  
  def alert?
    quantity < min_alert?
  end
end
