# Time - O(n)
# Space - O(n)
require 'set'
def zero_sum_subarray(nums)
  sums = Set.new([0])
  current_sum = 0
  nums.each do |num|
    current_sum += num
    return true if sums.include?(current_sum)
    sums.add(current_sum)
  end
  false
end

p zero_sum_subarray([-5, -5, 2, 3, -2])
