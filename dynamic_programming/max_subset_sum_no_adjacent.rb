# Time = O(n)
# Space - O(1)
def max_subset_sum_no_adjacent(array)
  return 0 unless array.length
  return array[0] if array.length == 1
  second = array[0]
  first = [array[0], array[1]].max
  (2...array.length).each do |i|
    current = [first, second + array[i]].max
    second = first
    first = current
  end
  first
end

p max_subset_sum_no_adjacent([7, 10, 12, 7, 9, 14]) # 33 -> 7 + 12 + 14
p max_subset_sum_no_adjacent([75, 105, 120, 75, 90, 135]) # 330 -> 75 + 120 + 135
