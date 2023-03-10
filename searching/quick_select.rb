# Time = O(n) - Best, Average OR O(n^2) - Worst
# Space = O(1)

def quick_select(array, k)
  position = k - 1 # if finding smallest postion
  # position = k + 1 # if finding largest postion
  quick_select_helper(array, position, 0, array.length - 1)
end

def quick_select_helper(array, position, start_idx, end_idx)
  # while true
    return if (start_idx > end_idx)
    pivot_idx = start_idx
    left_idx = start_idx + 1
    right_idx = end_idx

    while left_idx <= right_idx
      if array[left_idx] > array[pivot_idx] && array[right_idx] < array[pivot_idx]
        array[left_idx], array[right_idx] = array[right_idx], array[left_idx]
      end
      left_idx += 1 if array[left_idx] <= array[pivot_idx]
      right_idx -= 1 if array[right_idx] >= array[pivot_idx]
    end
    array[pivot_idx], array[right_idx] = array[right_idx], array[pivot_idx]

    if right_idx == position
      return array[right_idx]
    elsif right_idx < position
      start_idx = right_idx + 1
    else
      end_idx = right_idx - 1
    end
  # end
end

p quick_select([8, 5, 2, 9, 7, 6, 3], 3)