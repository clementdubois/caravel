class LineOrder < ActiveRecord::Base
  belongs_to :order
  has_many :line_receptions
end
