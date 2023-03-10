# def find_fair_index(a, b)
#   count = 0
#   a.each_index do |k|
#     if k > 0 && a[0...k].sum == b[0...k].sum && a[k..-1].sum == b[k..-1].sum && a[0...k].sum == a[k..-1].sum
#       count += 1
#     end
#   end
#   count
# end

def find_fair_index(a, b)
  sum_a = 0
  sum_b = 0
  (0...a.length).each do |i|
    sum_a += a[i]
    sum_b += b[i]
  end

  count = 0
  temp_a = a[0]
  temp_b = b[0]
  (1...a.length).each do |j|
    if j != 1 && temp_a == temp_b && 2 * temp_a == sum_a && 2 * temp_b == sum_b
      count += 1
    end
    temp_a += a[j]
    temp_b += b[j]
  end
  count
end


p find_fair_index([0, 4, -1, 0, 3], [0, -2, 5, 0, 3])
p find_fair_index([2, -2, -3, 3], [0, 0, 4, -4 ])
p find_fair_index([4, -1, 0, 3], [-2, 6, 0, 4 ])
p find_fair_index([3, 2, 6], [4, 1, 6])
p find_fair_index([1, 4, 2, -2, 5], [7, -2, -2, 2, 5])
