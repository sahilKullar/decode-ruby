def count_inversions(array)
  count_sub_array_inversions(array, 0, array.length)
end

def count_sub_array_inversions(array, start, last)
  return 0 if last - start <= 1

  middle = start + ((last - start) / 2).floor
  left_inversions = count_sub_array_inversions(array, start, middle)
  right_inversions = count_sub_array_inversions(array, middle, last)
  merged_array_inversions = merge_sort_and_count_inversions(array, start, middle, last)
  left_inversions + right_inversions + merged_array_inversions
end

def merge_sort_and_count_inversions(array, start, middle, last)
  sorted_array = []
  left = start
  right = middle
  inversions = 0
  while left < middle && right < last
    if array[left] <= array[right]
      sorted_array << array[left]
      left += 1
    else
      inversions += (middle - left)
      sorted_array << array[right]
      right += 1
    end
  end
  # sorted_array.push(array.slice(left, middle), array.slice(right, last))

  while left < middle
    sorted_array << array[left]
    left += 1
  end

  while right < last
    sorted_array << array[right]
    right += 1
  end

  (sorted_array.length).times do |i|
    array[start + i] = sorted_array[i]
  end
  # (0..sorted_array.length - 1).each do |i|
  #   array[start + i] = sorted_array[i]
  # end

  inversions
end

print count_inversions([2, 3, 3, 1, 9, 5, 6])