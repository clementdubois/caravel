class Reception < ActiveRecord::Base
  has_many :line_receptions, :dependent => :destroy
  
end
