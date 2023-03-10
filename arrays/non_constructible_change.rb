# Time - O(nlog(n))
# Space - O(1)

def non_constructible_change(coins)
  coins.sort!{ |a, b| a - b }
  current_change_created = 0
  coins.each do |coin|
    return current_change_created + 1 if coin > current_change_created + 1
    current_change_created += coin
  end
  current_change_created + 1
end

p non_constructible_change([1, 2, 5])
p non_constructible_change([5, 7, 1, 1, 2, 3, 22])