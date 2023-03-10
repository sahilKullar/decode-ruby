# Time - O(nd)
# Space - O(n)

def number_of_ways_to_make_coin_change(n, denominations)
  ways = Array.new(n + 1, 0)
  ways[0] = 1
  denominations.each do |denom|
    (0...ways.length).each do |amount| # (0...n + 1).each
      if denom <= amount
        ways[amount] += ways[amount - denom]
      end
    end
  end
  ways[n]
end

p number_of_ways_to_make_coin_change(6, [1, 5 ]) # 1 * 6 and 1 * 1 + 5 * 1
p number_of_ways_to_make_coin_change(10, [1, 5, 10, 25 ])
