# frozen_string_literal: true

# Time - O(n)
# Space - O(1)
def has_single_cycle(array)
  num_elements_visited = 0
  current_idx = 0
  while num_elements_visited < array.length
    return false if num_elements_visited > 0 && current_idx == 0
    num_elements_visited += 1
    current_idx = get_next_idx(current_idx, array)
  end
  current_idx == 0
end

def get_next_idx(current_idx, array)
  jump = array[current_idx]
  next_idx = (current_idx + jump) % array.length
  next_idx >= 0 ? next_idx : next_idx + array.length
end

p has_single_cycle([2, 3, 1, -4, -4, 2])
p has_single_cycle([1, -1, 1, -1])
