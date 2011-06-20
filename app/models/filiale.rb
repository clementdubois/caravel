class Filiale < ActiveRecord::Base
  has_many :employes, :class_name => "User"
  has_many :stocks
  has_many :orders
  has_many :receptions
  has_many :received_orders, :class_name => "Order", :as => :receiver


end
