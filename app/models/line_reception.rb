class LineReception < ActiveRecord::Base
  belongs_to :reception
  belongs_to :reference
  belongs_to :line_order
end
