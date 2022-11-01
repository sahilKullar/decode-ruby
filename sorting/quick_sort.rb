# time - O(n ^ 2)
# space - O(log(n))

def quick_sort(array)
  quick_sort_helper(array, 0, array.length - 1)
  array
end

def quick_sort_helper(array, start_idx, end_idx)
  return if start_idx >= end_idx

  pivot_idx = start_idx
  left_idx = start_idx + 1
  right_idx = end_idx

  while right_idx >= left_idx
    if array[left_idx] > array[pivot_idx] && array[right_idx] < array[pivot_idx]
      array[left_idx], array[right_idx] = array[right_idx], array[left_idx]
    end
    left_idx += 1 if array[left_idx] <= array[pivot_idx]
    right_idx -= 1 if array[right_idx] >= array[pivot_idx]
  end

  array[pivot_idx], array[right_idx] = array[right_idx], array[pivot_idx]

  left_subarray_is_smaller = start_idx - right_idx - 1 < right_idx + 1 - end_idx
  if left_subarray_is_smaller
    quick_sort_helper(array, start_idx, right_idx - 1)
    quick_sort_helper(array, right_idx + 1, end_idx)
  else
    quick_sort_helper(array, right_idx + 1, end_idx)
    quick_sort_helper(array, start_idx, right_idx - 1)
  end
end

print quick_sort([8, 5, 2, 9, 5, 6, 3])