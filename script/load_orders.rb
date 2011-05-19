Order.transaction do 
  (1..100).each do |i|
    Order.create(:name => "Customer #{i}", :address => "#{i} Rue du simplon", :email => "customer-#{i}@test.com", :pay_type => "Credit card")
  end
end