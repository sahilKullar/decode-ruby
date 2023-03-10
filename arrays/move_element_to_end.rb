# Time - O(n)
# Space - O(1)

def move_element_to_end(array, to_move)
  left_idx = 0
  right_idx = array.length - 1
  while left_idx < right_idx
    right_idx -= 1 while left_idx < right_idx && array[right_idx] == to_move
    array[left_idx], array[right_idx] = array[right_idx], array[left_idx] if array[left_idx] == to_move
    left_idx += 1
  end
  array
end

p move_element_to_end([2, 1, 2, 2, 2, 3, 4, 2], 2)