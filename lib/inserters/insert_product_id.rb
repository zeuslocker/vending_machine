require "readline"
require_relative '../test_task/constants'

class InsertProductId
  def call
    while product_id = Readline.readline('> ', false) do
      puts product_id
      if product_id.to_i.to_s == product_id
        product = Constants::PRODUCT_LIST.find{|p| p.id == product_id.to_i }

        if product
          puts "#{product.name} is selected"
          return product
        else
          puts 'Product not found'
          next
        end
      end
      puts 'Invalid input'
    end
  end
end