# Time - O(nd)
# Space - O(n)

def min_number_of_coins_for_change(n, denominations)
  num_of_coins = Array.new(n + 1, Float::INFINITY)
  num_of_coins[0] = 0
  denominations.each do |denom|
    (0...num_of_coins.length).each do |amount|
      if denom <= amount
        num_of_coins[amount] = [num_of_coins[amount], num_of_coins[amount - denom] + 1 ].min
      end
    end
  end
  num_of_coins[n] != Float::INFINITY ? num_of_coins[n] : -1
end

p min_number_of_coins_for_change(6, [1, 2, 4])
p min_number_of_coins_for_change(7, [1, 5, 10]) # 2*1 + 1*5

