# Time - O(n)
# Space - O(n)

# def two_number_sum(array, target_sum)
#   nums = {}
#   array.each do |num|
#     potential_num = target_sum - num
#     if nums.key? potential_num
#       return [potential_num, num]
#     else
#       nums[num] = true
#     end
#   end
#   []
# end

# Time - O(nlog(n))
# Space - O(1)
def two_number_sum(array, target_sum)
  array.sort!{ |a, b| a - b }
  left_idx = 0
  right_idx = array.length - 1
  while left_idx <= right_idx
    current_sum = array[left_idx] + array[right_idx]
    if current_sum == target_sum
      return [array[left_idx], array[right_idx]]
    elsif current_sum < target_sum
      left_idx += 1
    elsif current_sum > target_sum
      right_idx -= 1
    end
  end
  []
end

p two_number_sum([3, 5, -4, 8, 11, 1, -1, 6], 10)