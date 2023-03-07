# time - O(n)
# space - O(1)

def three_number_sort(array, order)
  first_value = order[0]
  second_value = order[1]

  first_idx = 0
  second_idx = 0
  third_idx = array.length - 1

  while second_idx <= third_idx
    value = array[second_idx]
    if value == first_value
      array[first_idx], array[second_idx] = array[second_idx], array[first_idx]
      first_idx += 1
      second_idx += 1
    elsif value == second_value
      second_idx += 1
    else
      array[second_idx], array[third_idx] = array[third_idx], array[second_idx]
      third_idx -= 1
    end
  end
  array
end

print three_number_sort([1, 0, 0, -1, -1, 0, 1, 1], [0, 1, -1])
