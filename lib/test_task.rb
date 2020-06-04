require_relative "test_task/version"
require_relative "printers/print_product_list"
require_relative 'inserters/insert_product_id'
require_relative 'inserters/insert_money'

puts 'Hi, please choose one of the following products: '
puts PrintProductList.new.call
product = InsertProductId.new.call
inserted_money = InsertMoney.new(product.price).call
