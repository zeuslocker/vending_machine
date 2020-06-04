require "readline"
require_relative '../test_task/constants'

class InsertMoney
  def initialize(required_sum)
    @inserted_money = 0
    @required_sum = required_sum
  end

  def call
    puts "Inserted: #{@inserted_money}$, Required: #{@required_sum}$"
    while coin = Readline.readline('> ', false) do
      coin_value = parse_coin(coin)
      if coin_value
        @inserted_money += coin_value
        if @inserted_money >= @required_sum
          puts "Thanks, take your product and your change: #{@inserted_money - @required_sum}$"
          return
        end
        status
      else
        puts 'Invalid coin'
        status
      end
    end
  end
  private

  def status
    puts "Inserted: #{@inserted_money}$, Required: #{@required_sum}$"
  end
  def parse_coin(coin)
    # could be one regex but this just more readable
    coin_match_data = coin.match(/\A(25|50)c\z/)
    puts coin_match_data.inspect
    return ('0.' + coin_match_data[1]).to_f if coin_match_data

    coin_match_data = coin.match(/\A(1|2|5)\$\z/)
    return coin_match_data[1].to_i if coin_match_data
  end

end