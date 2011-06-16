class Stock < ActiveRecord::Base
  belongs_to :reference
  belongs_to :filiale
end
