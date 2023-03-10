# Time - O(n)
# Space - O(1)

def subarray_sort(array)
  min_out_of_order = Float::INFINITY
  max_out_of_order = -Float::INFINITY
  (0..array.length - 1).each do |i|
    num = array[i]
    if is_out_of_order(i, num, array)
      min_out_of_order = [min_out_of_order, num].min
      max_out_of_order = [max_out_of_order, num].max
    end
  end

  if min_out_of_order == Float::INFINITY
    return [-1, -1]
  end

  left_idx = 0
  while min_out_of_order >= array[left_idx]
    left_idx += 1
  end

  right_idx = array.length - 1
  while max_out_of_order <= array[right_idx]
    right_idx -= 1
  end

  [left_idx, right_idx]
end

def is_out_of_order(i, num, array)
  return num > array[i + 1] if i == 0
  return num < array[i - 1] if i == array.length - 1
  num > array[i + 1] || num < array[i - 1]
end

p subarray_sort([1, 2, 4, 7, 10, 11, 7, 12, 6, 7, 16, 18, 19])