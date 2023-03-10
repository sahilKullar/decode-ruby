# Time - O(n ^ 2)
# Space - O(n)
# def array_of_products(array)
#   products = []
#   (0..array.length - 1).each do |i|
#     running_product = 1
#     (0..array.length - 1).each do |j|
#       running_product *= array[j] if i != j
#     end
#     products[i] = running_product
#   end
#   products
# end

# Time - O(n)
# Space - O(n)
def array_of_products(array)
  products = []

  left_running_product = 1
  (0..array.length - 1).each do |i|
    products[i] = left_running_product
    left_running_product *= array[i]
  end

  right_running_product = 1
  (array.length - 1).downto(0).each do |i|
    products[i] *= right_running_product
    right_running_product *= array[i]
  end

  products
end

p array_of_products([5, 1, 4, 2])