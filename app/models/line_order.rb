class LineOrder < ActiveRecord::Base
  belongs_to :order
  has_many :line_receptions
  belongs_to :reference
  
  def reference_name
    return reference.name
  end
  
  def reference_name=(name)
    self.reference = Reference.find_by_name(name) unless name.blank
  end
end
