# Time - O(n)
# Space - O(n)

require 'set'

def smallest_positive_integer(array)
  smallest_positive_int = Set.new
  array.each do |num|
    smallest_positive_int << num if num > 0
  end
  smallest_missing_int = 1
  while smallest_positive_int.include? smallest_missing_int
    smallest_missing_int += 1
  end
  smallest_missing_int
end

p smallest_positive_integer([1, 3, 6, 4, 1, 2])
