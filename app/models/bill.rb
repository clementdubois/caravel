class Bill < ActiveRecord::Base
  belongs_to :order
  has_many :line_bills, :dependent => :destroy
end
