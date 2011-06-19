class Bill < ActiveRecord::Base
  belongs_to :reception
  belongs_to :order 
  has_many :line_bills, :dependent => :destroy
end
