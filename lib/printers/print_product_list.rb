require_relative '../test_task/constants'

class PrintProductList
  def call
    available_products = Constants::PRODUCT_LIST.reject{|p| p.count <= 0 }
    available_products.map do |p|
      "#{p.id} - #{p.name}, price: #{p.price}"
    end
  end
end