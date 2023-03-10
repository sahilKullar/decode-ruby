# Time - O(n)
# Space - O(d) where d is the depth of arrays inside array
def product_sum(array, multiplier = 1)
  sum = 0
  array.each do |value|
    if value.is_a? Array
      sum += product_sum(value, multiplier + 1)
    else
      sum += value
    end
  end
  sum * multiplier
end

p product_sum([5, 2, [7, -1], 3, [6, [-13, 8], 4]])
