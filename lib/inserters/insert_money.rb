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
          puts "Thanks, take your product and your change: #{money_change}"
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

  def money_change
    res = ''
    change = @inserted_money - @required_sum
    change_left = change

    Constants::AVAILABLE_CASH.each do |cash_val|
      if change_left >= cash_val
        res << cash_val.to_s + '$ '
        change_left -= cash_val
        redo
      end
    end

    Constants::AVAILABLE_COINS.each do |cash_val|
      if change_left >= cash_val
        res << cash_val.to_s + 'c '
        change_left -= cash_val
        redo
      end
    end

    res = '0$' if res.empty?
    res
  end

  def parse_coin(coin)
    # could be one regex but this just more readable
    coin_match_data = coin.match(/\A(#{Constants::AVAILABLE_COINS.join('|')})c\z/)
    return ('0.' + coin_match_data[1]).to_f if coin_match_data

    coin_match_data = coin.match(/\A(#{Constants::AVAILABLE_CASH.join('|')})\$\z/)
    return coin_match_data[1].to_i if coin_match_data
  end
end