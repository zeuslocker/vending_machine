require 'ostruct'

module Constants
  PRODUCT_LIST = [
    { id: 1, name: 'CocaCola', price: 1.5, count: 1 },
    { id: 2, name: 'Fanta', price: 1, count: 1 },
    { id: 3, name: 'Sprite', price: 2, count: 1 },
    { id: 4, name: 'Lays', price: 2, count: 0 }
  ].map{|p| OpenStruct.new(p) }

  AVAILABLE_COINS = [0.5, 0.25]
  AVAILABLE_CASH = [ 5, 2, 1]
end