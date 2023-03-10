# Time = O(n ^ 2)
# Space = O(n)

def three_number_sum(array, target_sum)
  array.sort! { |a, b| a - b }
  triplets = []
  (0...array.length - 2).each do |i|
    left_idx = i + 1
    right_idx = array.length - 1
    while left_idx < right_idx
      current_sum = array[i] + array[left_idx] + array[right_idx]
      if current_sum == target_sum
        triplets << [array[i], array[left_idx], array[right_idx]]
        left_idx += 1
        right_idx -= 1
      elsif current_sum < target_sum
        left_idx += 1
      elsif current_sum > target_sum
        right_idx -= 1
      end
    end
  end
  triplets
end

p three_number_sum([12, 3, 1, 2, -6, 5, -8, 6], 0)