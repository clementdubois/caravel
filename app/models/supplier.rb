class Supplier < ActiveRecord::Base
  has_many :references
  has_many :stocks, :through => :references
  has_many :orders, :as => :receiver
end
