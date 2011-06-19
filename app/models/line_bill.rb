class LineBill < ActiveRecord::Base
  belongs_to :bill
  belongs_to :reference
  belongs_to :line_reception
end
