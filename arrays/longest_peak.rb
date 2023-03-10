# Time - O(n)
# Space - O(1)

def longest_peak(array)
  i = 1
  longest_peak_length = 0
  while i < array.length - 1
    is_peak = array[i - 1] < array[i] && array[i] > array[i + 1]
    unless is_peak
      i += 1
      next
    end

    left_idx = i - 2
    while left_idx >= 0 && array[left_idx] < array[left_idx + 1]
      left_idx -= 1
    end

    right_idx = i + 2
    while right_idx < array.length && array[right_idx] < array[right_idx - 1]
      right_idx += 1
    end

    current_longest_peak = right_idx - left_idx - 1
    longest_peak_length = [current_longest_peak, longest_peak_length].max
    i = right_idx
  end
  longest_peak_length
end

p longest_peak([1, 2, 3, 3, 4, 0, 10, 6, 5, -1, -3, 2, 3])
