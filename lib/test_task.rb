require_relative "test_task/constants"
require_relative "printers/print_product_list"
require_relative 'inserters/insert_product_id'
require_relative 'inserters/insert_money'

while true do
puts 'Hi, please choose one of the following products: '
puts PrintProductList.new.call
product = InsertProductId.new.call
InsertMoney.new(product.price).call
Constants::PRODUCT_LIST.find{|p| p.id == product.id}.count -= 1

  if Constants::PRODUCT_LIST.all?{|p| p.count == 0 }
    puts 'Vending machine is empty' 
    break
  end
end