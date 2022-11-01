# Time = O(nLog(n))
# space = O(nLog(n))

def merge_sort(array)
  return array if array.length <= 1
  middle_idx = (array.length / 2).floor
  left_half = array.slice(0, middle_idx)
  right_half = array.slice(middle_idx, array.length)
  merge_sorted_arrays(merge_sort(left_half), merge_sort(right_half))
end

def merge_sorted_arrays(left_half, right_half)
  sorted_array = Array.new(left_half.length + right_half.length)
  i, j, k = [0, 0, 0]
  while i < left_half.length && j < right_half.length
    if left_half[i] <= right_half[j]
      sorted_array[k] = left_half[i]
      i += 1
    else
      sorted_array[k] = right_half[j]
      j += 1
    end
    k += 1
  end

  while i < left_half.length
    sorted_array[k] = left_half[i]
    i += 1
    k += 1
  end

  while j < right_half.length
    sorted_array[k] = right_half[j]
    j += 1
    k += 1
  end

  sorted_array
end

print merge_sort([8, 5, 2, 9, 5, 6, 3])