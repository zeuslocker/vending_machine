require 'ostruct'

module Constants
  PRODUCT_LIST = [
    { id: 1, name: 'CocaCola', price: 1.5, count: 5 },
    { id: 2, name: 'Fanta', price: 1, count: 7 },
    { id: 3, name: 'Sprite', price: 2, count: 3 },
    { id: 4, name: 'Lays', price: 2, count: 0 }
  ].map{|p| OpenStruct.new(p) }
end