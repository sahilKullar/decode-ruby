# Time - O(nc)
# Space - O(nc)

def knapsack_problem(items, capacity)
  knapsack_values = []
  (items.length + 1).times do |i|
    knapsack_values << Array.new(capacity + 1, 0)
  end

  (1...items.length + 1).each do |i|
    current_value = items[i - 1][0]
    current_weight = items[i - 1][1]
    (0...capacity + 1).each do |c|
      if current_weight > c
        knapsack_values[i][c] = knapsack_values[i - 1][c]
      else
        knapsack_values[i][c] = [knapsack_values[i][c], knapsack_values[i - 1][c - current_weight] + current_value].max
      end
    end
  end
  [knapsack_values[items.length][capacity], get_knapsack_items(knapsack_values, items)]
end

def get_knapsack_items(knapsack_values, items)
  sequences = []
  i = knapsack_values.length - 1
  c = knapsack_values[0].length - 1
  while i > 0
    if knapsack_values[i][c] == knapsack_values[i - 1][c]
      i -= 1
    else
      sequences.unshift(i - 1)
      c -= items[i - 1][1]
      i -= 1
    end
    break if c == 0
  end
  sequences
end

p knapsack_problem([[1, 2], [4, 3], [5, 6], [6, 7]], 10)