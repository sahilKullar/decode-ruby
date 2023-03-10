# Time = O(n)
# Space = O(n)

def sorted_squared_array(array)
  squared_array = []
  smaller_value_idx = 0
  larger_value_idx = array.length - 1

  # (0..array.length - 1).reverse_each do |i|
  (array.length - 1).downto(0) do |i|
    smaller_value = array[smaller_value_idx]
    larger_value = array[larger_value_idx]

    if smaller_value.abs > larger_value.abs
      squared_array[i] = smaller_value * smaller_value
      smaller_value_idx += 1
    else
      squared_array[i] = larger_value * larger_value
      larger_value_idx -= 1
    end
  end

  squared_array
end

p sorted_squared_array([1, 2, 3, 5, 6, 8, 9])
p sorted_squared_array([-5, -4, -3, -2, -1])